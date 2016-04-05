require 'csv'

task :xmlord => :environment do

  desc "Load all data into XML and save on S3"
  
  if ImportControl.count==0
    @order = Spree::Order.all
    @import_control = ImportControl.create(:last_id=> @order.last.id)
  else
    @import_control = ImportControl.first
    @orders = Spree::Order.where("id>?",@import_control.last_id)
    if @orders.length > 0
      @import_control.update_attribute(:last_id,@orders.last.id)
    end
  end

  if @orders.length > 0

    @address = Spree::Address.all
    @user = Spree::User.all

    print "--- setting up Amazon s3 connection ---"
    amazon = S3::Service.new(access_key_id:ENV["AWS_ACCESS_KEY_ID"] , secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"])
    bucket = amazon.buckets.find("recharge-cartridges")

      @orders.each do |o|
        @line = Spree::LineItem.where(order_id: o.id)
        tmp_filename="#{Rails.root}/tmp/orders-#{o.id}-#{Time.now.strftime('%d-%m-%Y-%H-%M-%S')}.xml"
        file = File.new(tmp_filename, 'w')
   
        xml = Builder::XmlMarkup.new(target: file, :indent => 4)
        xml.instruct! :xml, :version=>'1.0'

        xml.Order do

          xml.OrderReferences do
            xml.BuyersOrderNumber o.id
            xml.PORef o.id
          end

          xml.OrderDate o.completed_at

          xml.OrderTotal do
            xml.GoodsValue o.total
            xml.GoodsTax o.item_total
            xml.TaxTotal o.additional_tax_total
            xml.AmountPaid o.payment_total
          end

          xml.Buyer do
            xml.BuyerReferences do
              xml.SuppliersCodeForBuyer "TEST7"
            end
            xml.Party o.bill_address.company
            xml.Address do
              xml.AddressLine o.bill_address.address1
              xml.AddressLine o.bill_address.address2
              xml.City o.bill_address.city
              xml.PostCode o.bill_address.zipcode
              xml.Country o.bill_address.country.name
            end
            xml.Contact do
              xml.Name o.bill_address.firstname
              xml.DDI o.bill_address.phone
              xml.Email o.email
            end
          end

          xml.InvoiceTo do
            xml.Party o.bill_address.company
            xml.Address do
              xml.AddressLine o.bill_address.address1
              xml.AddressLine o.bill_address.address2
              xml.City o.bill_address.city
              xml.PostCode o.bill_address.zipcode
              xml.Country o.bill_address.country.name
            end
            xml.Contact do
              xml.Name o.bill_address.firstname
              xml.DDI o.bill_address.phone
              xml.Email o.email
            end
          end

          xml.Delivery do
            xml.DeliverTo do
              xml.Party o.ship_address.company
              xml.Address do
                xml.AddressLine o.ship_address.address1
                xml.AddressLine o.ship_address.address2
                xml.City o.ship_address.city
                xml.PostCode o.ship_address.zipcode
                xml.Country o.ship_address.country.name
              end
              xml.Contact do
                xml.Name o.ship_address.firstname
                xml.DDI o.ship_address.phone
                xml.Email o.email
              end
              xml.DeliverToReferences do
                xml.BuyersCodeForLocation o.id
              end
            end
          end

          @line.each do |p|

            xml.OrderLine do
              xml.LineNumbers p.id
              xml.Product do
                xml.SuppliersProductCode p.product.ts_code
                xml.Description p.product.name
              end
              xml.Quantity do
                xml.Amount p.quantity
              end
              xml.Price do
                xml.UnitPrice p.product.price
                xml.LineTax do
                  xml.TaxRate "23%"
                  xml.TaxValue p.additional_tax_total
                end
              end
              xml.CostCentre "test"
            end

          end
        
        end

        file.close

        # Write the file out to S3
        s3_file = bucket.objects.build("imports/orders-#{o.id}-#{Time.now.strftime('%d-%m-%Y-%H-%M-%S')}.xml")
        f = File.open(tmp_filename,'r')

        s3_file.content = f.read
        s3_file.save
        print "--- writing file for order #{o.id} ----"

      end
    

  else
    print "--- No new orders to process ---"
  end
end