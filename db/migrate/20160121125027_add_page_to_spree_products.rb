class AddPageToSpreeProducts < ActiveRecord::Migration
  def change
	  add_column :spree_products, :page, :string, :default => "Blank"
  end
end
