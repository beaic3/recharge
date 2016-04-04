class RemoveShortDescriptionFromSpreeProducts < ActiveRecord::Migration
  def change
	  remove_column :spree_products, :short_description
  end
end
