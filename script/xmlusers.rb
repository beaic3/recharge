require 'builder'
@user = Spree::User.all.limit(5)
    file = File.new("#{Rails.root}/public/users.xml", 'w')
 
    xml = Builder::XmlMarkup.new(target: file, :indent => 2)
    xml.instruct! :xml, :version=>'1.0'
 
    xml.tag! 'users' , 'version' => '1.0' do
      xml.array do
        @user.each do |u|
          xml.user do
            xml.key 'email'
            xml.string u.email
            xml.key 'sign_in_count'
            xml.string u.sign_in_count
            xml.key 'created_at'
            xml.string u.created_at
          end
        end
      end
    end