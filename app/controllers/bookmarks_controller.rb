class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def index
    @bookmarks = Bookmark.all
    authorize @bookmarks
  end
  # return a collection of bookmarks

  def new
    puts params
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def edit
    # @bookmark = Bookmark.find(bookmark_params)
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def create
    puts @bookmark
    @bookmark = Bookmark.new
    authorize @bookmark

    @bookmark.url = params[:bookmark][:url]
    @topic = Topic.find(params[:topic_id])
    @user = current_user
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic
    @bookmark.user = @user
    if @bookmark.save
      puts '>>>>> bookmark was saved'
      flash[:notice] = 'Bookmark was saved.'
      redirect_to [@topic, @bookmark]
    else
      puts '>>>>> failed to save bookmark'
      lash[:error] = 'There was an error saving the bookmark. Please try again.'
      render :new
       end
   end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.assign_attributes(bookmark_params)
    if @bookmark.save
      puts '>>>>> bookmark was saved'
      flash[:notice] = 'Bookmark was updated.'
      redirect_to [@bookmark.topic, @bookmark]
    else
      puts '>>>>> failed to save bookmark'
      flash[:error] = 'There was an error saving this bookmark. Please try again.'
      render :edit
    end
    end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash[:error] = 'There was an error deleting the bookmark.'
      render :show
    end
    end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic, :user)
    end
end
