class AddAddressToSpreeProducts < ActiveRecord::Migration
  def change
	  add_column :spree_products, :address, :string, :default => "none"
	  add_column :spree_products, :email, :string, :default => "none"
	  add_column :spree_products, :mailer, :string, :default => "none"
	  add_column :spree_products, :phone, :string, :default => "none"
  end
end
