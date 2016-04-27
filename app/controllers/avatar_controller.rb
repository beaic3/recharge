class AvatarController < ApplicationController
  def new
    @uploader = User.new.avatar
    @uploader.success_action_redirect = new_user_url
    @uploader.update_attribute :avatar_key, params[:key]
  end
end