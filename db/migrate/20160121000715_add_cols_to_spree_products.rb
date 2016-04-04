class AddColsToSpreeProducts < ActiveRecord::Migration
  def change
	  add_column :spree_products, :ts_code, :string, :default => "Blank"
	  add_column :spree_products, :live, :string, :default => "Blank"
	  add_column :spree_products, :short_description, :string, :default => "Blank"
	  add_column :spree_products, :detail, :string, :default => "Blank"
	  add_column :spree_products, :rrp, :string, :default => "Blank"
	  add_column :spree_products, :sell, :string, :default => "Blank"
	  
	  add_column :spree_products, :page_yield, :string, :default => "Blank"
	  add_column :spree_products, :colour, :string, :default => "Blank"
	  add_column :spree_products, :weight, :string, :default => "Blank"
	  add_column :spree_products, :barcode, :string, :default => "Blank"
	  add_column :spree_products, :box_size, :string, :default => "Blank"
	  add_column :spree_products, :short_oem_code, :string, :default => "Blank"
	  
	  add_column :spree_products, :daily_stock, :string, :default => "Blank"
	  add_column :spree_products, :min, :string, :default => "Blank"
	  add_column :spree_products, :max, :string, :default => "Blank"
	  add_column :spree_products, :image_url, :string, :default => "Blank"
	  add_column :spree_products, :oem_code, :string, :default => "Blank"
	  
	  add_column :spree_products, :pack, :string, :default => "Blank"
	  add_column :spree_products, :vow_oem_code, :string, :default => "Blank"
	  add_column :spree_products, :spicers_oem_code, :string, :default => "Blank"
	  add_column :spree_products, :vow_compat_code, :string, :default => "Blank"
	  add_column :spree_products, :spicers_compat_code, :string, :default => "Blank"
	  add_column :spree_products, :brand, :string, :default => "Blank"
	  
	  add_column :spree_products, :manufacturer, :string, :default => "Blank"
	  add_column :spree_products, :category, :string, :default => "Blank"
	  add_column :spree_products, :chip_issue, :string, :default => "Blank"
	  add_column :spree_products, :machine_models, :string, :default => "Blank"
	  add_column :spree_products, :keywords, :string, :default => "Blank"
  end
end
