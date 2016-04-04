class ChangeupColsFromSpreeProducts < ActiveRecord::Migration
  def change
	  add_column :spree_products, :ts_code, :string, :default => "Blank"
  end
end
