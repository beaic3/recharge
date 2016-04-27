class ProdUpdateController < ApplicationController

  def new
    @uploader = Spree::User.new.prod_update
    @uploader.success_action_redirect = new_spree_user_url
  end

end