class UsersController < ApplicationController
#   after_action :authenticate_user!, :except => [:show]
# after_action :verify_authorized
before_action :authenticate_user!, except: [:show]

  def show
    #  @user = User.find(params[:id])
    #  @bookmarks = @user.bookmarks
    #  @likes = @bookmarks.likes
     @user = current_user
    @user_bookmarks = @user.bookmarks
    @liked_bookmarks = @user.liked_bookmarks
# authorize @user_bookmarks
# authorize @liked_bookmarks

  end
end
