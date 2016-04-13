require 'csv'

desc "Imports a CSV file into an ActiveRecord table"

task :update, [:filename] => :environment do
	CSV.foreach('https://s3-eu-west-1.amazonaws.com/recharge-cartridges/recharge_pricing.csv', :headers => true) do |row|
		product = Spree::Product.find_or_create_by(ts_code: row["ts_code"])
		parameters = ActionController::Parameters.new(row.to_hash)
		product.update(parameters.permit(:cost_price,:price))
	end
end