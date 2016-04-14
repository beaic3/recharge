require 'csv'

desc "Imports a CSV file into an ActiveRecord table"

task :update, [:filename] => :environment do
	CSV.new(open("https://s3-eu-west-1.amazonaws.com/recharge-cartridges/recharge_pricing.csv"), :headers => true).each do |row|
		product = Spree::Product.find_or_create_by(ts_code: row["ts_code"])
		parameters = ActionController::Parameters.new(row.to_hash)
		product.update(parameters.permit(:cost_price,:price))
	end

	puts "--- update complete ---"

	puts "--- setting up Amazon s3 connection ---"
	amazon = S3::Service.new(access_key_id:ENV["AWS_ACCESS_KEY_ID"] , secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"])

	puts "--- finding bucket recharge-cartridges ---"
	bucket = amazon.buckets.find("recharge-cartridges")

	puts "--- finding csv file ---"
	object = bucket.objects.find("recharge_pricing.csv")

	puts "--- deleting csv file ---"
	object.destroy
	puts "--- process complete ---"

end