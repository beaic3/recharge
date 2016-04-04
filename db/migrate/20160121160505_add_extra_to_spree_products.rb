class AddExtraToSpreeProducts < ActiveRecord::Migration
  def change
	  add_column :spree_products, :machine_models2, :string, :default => "Blank"
  end
end
