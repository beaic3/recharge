Spree::User.class_eval do
	mount_uploader :prod_update, ProdUpdateUploader
end