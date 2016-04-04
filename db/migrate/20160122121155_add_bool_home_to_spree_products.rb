class AddBoolHomeToSpreeProducts < ActiveRecord::Migration
  def change
	  add_column :spree_products, :sale, :boolean, :default => false
	  add_column :spree_products, :featured, :boolean, :default => false
	  add_column :spree_products, :latest, :boolean, :default => false
  end
end
