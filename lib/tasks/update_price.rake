require 'open-uri'
require 'csv'

desc "Imports a CSV file into an ActiveRecord table"

task :update, [:filename] => :environment do
	CSV.new(open("https://s3-eu-west-1.amazonaws.com/recharge-cartridges/recharge_pricing.csv"), :headers => true).each do |row|
		product = Spree::Product.find_or_create_by(ts_code: row["ts_code"])
		parameters = ActionController::Parameters.new(row.to_hash)
		product.update(parameters.permit(:cost_price,:price))
	end

	print "--- setting up Amazon s3 connection ---"

    #amazon = AWS::S3::Client.new(access_key_id:ENV["AWS_ACCESS_KEY_ID"] , secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"])
    #bucket = amazon.buckets.find("recharge-cartridges")

    #print "--- Service started and bucket found ---"
    #print "--- Starting to copy file and delete original ---"

	s3 = Aws::S3.new(APP_CONFIG['AWS_ACCESS_KEY_ID'], APP_CONFIG['AWS_SECRET_ACCESS_KEY'])
	s3.bucket('recharge-cartridges').delete_key('recharge_pricing.csv')

    #amazon.move_to(bucket: "recharge-cartridges",
                   #copy_source: URI::encode("recharge-cartridges/recharge_pricing.csv"),
                   #key: "import_rename.csv")
    #amazon.delete_object(bucket: "recharge-cartridges",
                   #key: "recharge_pricing.csv")

end