class RemoveOldColsFromSpreeProducts < ActiveRecord::Migration
  def change
	  remove_column :spree_products, :rrp
	  remove_column :spree_products, :detail
	  remove_column :spree_products, :ts_code
  end
end
