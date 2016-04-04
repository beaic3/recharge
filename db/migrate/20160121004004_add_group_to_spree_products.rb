class AddGroupToSpreeProducts < ActiveRecord::Migration
  def change
	  add_column :spree_products, :group, :string, :default => "Blank"
  end
end
