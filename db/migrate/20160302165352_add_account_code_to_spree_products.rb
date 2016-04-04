class AddAccountCodeToSpreeProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :spicers_account_code, :string, :default => "blank"
	add_column :spree_products, :vow_account_code, :string, :default => "blank"
  end
end
