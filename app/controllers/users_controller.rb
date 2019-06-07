class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @bookmarks = @user.bookmarks.visible_to(current_user)
     @likes = @bookmarks.likes

    @user_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
  end
end
