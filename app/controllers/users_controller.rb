class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
after_action :verify_authorized
  def show
     @user = User.find(params[:id])
     @bookmarks = @user.bookmarks.visible_to(current_user)
     @likes = @bookmarks.likes

    @user_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
    authorize @user
  end
end
