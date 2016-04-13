#lib/tasks/import.rake

require 'csv'

desc "Imports a CSV file into an ActiveRecord table"

task :update2, [:filename] => :environment do
		CSV.foreach('csv/recharge_pricing.csv', :headers => true) do |row|
		prod = Spree::Product.find_by(ts_code: row["ts_code"])
		parameters = ActionController::Parameters.new(row.to_hash)
		prod.update(parameters.permit(:cost_price,:price))
		prod.save!
	end
end