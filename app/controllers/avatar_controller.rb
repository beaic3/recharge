class AvatarController < ApplicationController
  def new
    @uploader = Spree::Product.new.avatar
    @uploader.success_action_redirect = new_spree_product_url
    @uploader.update_attribute :avatar_key, params[:key]
  end
end