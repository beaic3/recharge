class AddSocialToSpreeProducts < ActiveRecord::Migration
  def change
	  add_column :spree_products, :twitter, :string, :default => "none"
	  add_column :spree_products, :facebook, :string, :default => "none"
	  add_column :spree_products, :linkedin, :string, :default => "none"
  end
end
