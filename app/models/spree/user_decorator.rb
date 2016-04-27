Spree::User.class_eval do
	mount_uploader :avatar, AvatarUploader
end