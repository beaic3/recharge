require 'builder'
@prod = Spree::Product.all.limit(5)
    file = File.new("#{Rails.root}/public/products.xml", 'w')
 
    xml = Builder::XmlMarkup.new(target: file, :indent => 2)
    xml.instruct! :xml, :version=>'1.0'
 
    xml.tag! 'products' , 'version' => '1.0' do
      xml.array do
        @prod.each do |p|
          xml.product do
            xml.key 'name'
            xml.string p.name
            xml.key 'description'
            xml.string p.description
            xml.key 'price'
            xml.string p.price
          end
        end
      end
    end