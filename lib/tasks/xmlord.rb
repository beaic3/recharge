require 'builder'
@order = Spree::Order.all
@address = Spree::Address.all
  file = File.new("#{Rails.root}/tmp/orders_sample.xml", 'w')
 
  xml = Builder::XmlMarkup.new(target: file, :indent => 4)
  xml.instruct! :xml, :version=>'1.0'
 
    @order.each do |o|
      xml.Order do

        xml.OrderReferences do
          xml.BuyersOrderNumber o.id
          xml.PORef "blank"
        end

        xml.OrderDate o.completed_at

        xml.OrderTotal do
          xml.GoodsValue o.total
          xml.GoodsTax o.id
          xml.TaxTotal o.id
          xml.AmountPaid o.payment_total
        end

        xml.Buyer do
          xml.BuyerReferences do
            xml.SuppliersCodeForBuyer o.id
          end
          xml.Party "blank"
          xml.Address do
            xml.AddressLine o.payment_total
            xml.City "blank"
            xml.State "blank"
            xml.PostCode o.id
            xml.Country "IE"
          end
          xml.Contact do
            xml.Name "blank"
            xml.DDI o.id
            xml.Email o.email
          end
        end

        xml.InvoiceTo do
          xml.Party "blank"
          xml.Address do
            xml.AddressLine "blank"
            xml.City "blank"
            xml.State "blank"
            xml.PostCode o.id
            xml.Country "IE"
          end
          xml.Contact do
            xml.Name "blank"
            xml.DDI o.id
            xml.Email "blank"
          end
        end

        xml.Delivery do
          xml.DeliverTo do
            xml.Party "blank"
            xml.Address do
              xml.AddressLine "blank"
              xml.City "blank"
              xml.State "blank"
              xml.PostCode o.id
              xml.Country "blank"
            end
            xml.Contact do
              xml.Name "blank"
              xml.DDI o.id
              xml.Email "blank"
            end
            xml.DeliverToReferences do
              xml.BuyersCodeForLocation o.id
            end
          end
        end

        xml.OrderLine do
          xml.LineNumbers "blank"
          xml.Product do
            xml.SuppliersProductCode o.id
            xml.Description "blank"
          end
          xml.Quantity do
            xml.Amount o.id
          end
          xml.Price do
            xml.UnitPrice o.id
            xml.LineTax do
              xml.TaxRate o.id
              xml.TaxValue o.id
            end
          end
          xml.CostCentre o.id
        end

        xml.OrderLine do
          xml.LineNumbers o.id
          xml.Product do
            xml.SuppliersProductCode o.id
            xml.Description "blank"
          end
          xml.Quantity do
            xml.Amount o.id
          end
          xml.Price do
            xml.UnitPrice o.id
            xml.LineTax do
              xml.TaxRate o.id
              xml.TaxValue o.id
            end
          end
          xml.CostCentre o.id
        end

        xml.OrderLine do
          xml.LineNumbers o.id
          xml.Product do
            xml.SuppliersProductCode o.id
            xml.Description "blank"
          end
          xml.Quantity do
            xml.Amount o.id
          end
          xml.Price do
            xml.UnitPrice o.id
            xml.LineTax do
              xml.TaxRate o.id
              xml.TaxValue o.id
            end
          end
          xml.CostCentre o.id
        end

        xml.OrderLine do
          xml.LineNumbers o.id
          xml.Product do
            xml.SuppliersProductCode o.id
            xml.Description "blank"
          end
          xml.Quantity do
            xml.Amount o.id
          end
          xml.Price do
            xml.UnitPrice o.id
            xml.LineTax do
              xml.TaxRate o.id
              xml.TaxValue o.id
            end
          end
          xml.CostCentre "blank"
        end

        xml.OrderLine do
          xml.LineNumbers o.id
          xml.Product do
            xml.SuppliersProductCode o.id
            xml.Description "blank"
          end
          xml.Quantity do
            xml.Amount o.id
          end
          xml.Price do
            xml.UnitPrice o.id
            xml.LineTax do
              xml.TaxRate o.id
              xml.TaxValue o.id
            end
          end
          xml.CostCentre o.id
        end

        xml.OrderLine do
          xml.LineNumbers o.id
          xml.Product do
            xml.SuppliersProductCode o.id
            xml.Description "blank"
          end
          xml.Quantity do
            xml.Amount o.id
          end
          xml.Price do
            xml.UnitPrice o.id
            xml.LineTax do
              xml.TaxRate o.id
              xml.TaxValue o.id
            end
          end
          xml.CostCentre o.id
        end
      
      end
    end

