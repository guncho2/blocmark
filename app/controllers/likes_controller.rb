class LikesController < ApplicationController
  def index
    @likes = like.all
    authorize @likes
  end

  def new

    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = Like.new
    authorize @like
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like

    if @like.save
      puts '>>>>> bookmark was saved'
      flash[:notice] = 'liked was saved.'
      redirect_to [@bookmark.topic, @bookmark]

      # Add code to generate a success flash and redirect to @bookmark
    else

      puts '>>>>> failed to save like'
      flash[:error] = 'There was an error saving the like. Please try again.'
      render :new
      # Add code to generate a failure flash and redirect to @bookmark
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])
    authorize @like
    # Get the bookmark from the params
    # Find the current user's like with the ID in the params

    if @like.destroy
      flash[:notice] = "\"#{@like.bookmark.url}\" was deleted successfully."
      redirect_to [@bookmark.topic, @bookmark]
      # Flash success and redirect to @bookmark
    else
      flash[:error] = 'There was an error deleting the like.'
      render :show

      # Flash error and redirect to @bookmark
    end
  end
end
