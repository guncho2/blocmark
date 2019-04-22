class BookmarksController < ApplicationController


  def show
	    @bookmark = Bookmark.find(params[:id])
       @topic = @bookmark.topic
	  end



    def index

      @bookmarks = Bookmark.all

      # return a collection of bookmarks
    end

	  def new

      @topic = Topic.find(params[:topic_id])
      @bookmark = Bookmark.new
	  end

	  def edit
	    @bookmark = Bookmark.find(params[:id])
	  end

	  def create
 #      @bookmark = Bookmark.new
 #
 #      @bookmark.url = params[:bookmark][:url]
 #     @bookmark = @topic.bookmarks.build(bookmark_params)
 #     @bookmark.user = current_user
 #      @topic = Topic.find(params[:topic_id])

 #     @bookmark.topic = @topic

 @topic = Topic.find(params[:topic_id])

 @user = current_user

 @bookmark = @topic.bookmarks.build(bookmark_params)


 @bookmark.topic = @topic
@bookmark.user = @user


	      if @bookmark.save
	        flash[:notice] = "Bookmark was saved."
	        redirect_to [@topic, @bookmark]
	      else
	        flash[:error] = "There was an error saving the bookmark. Please try again."
	        render :new
	      end
	   end

	   def update
	     @bookmark = Bookmark.find(params[:id])
	     @bookmark.assign_attributes(bookmark_params)

	     if @bookmark.save
	       flash[:notice] = "Bookmark was updated."
	       redirect_to [@bookmark.topic, @bookmark]
	     else
	       flash[:error] = "There was an error saving this bookmark. Please try again."
	       render :edit
	     end
	   end

	   def destroy
	     @bookmark = Bookmark.find(params[:id])

	     if @bookmark.destroy
	       flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
         redirect_to @bookmark.topic

	     else
	       flash[:error] = "There was an error deleting the bookmark."
	       render :show
	     end
	   end

	   private

	   def bookmark_params
	     params.require(:bookmark).permit(:url)
	   end

end
