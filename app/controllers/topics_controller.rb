class TopicsController < ApplicationController

  before_action :authenticate_user!

  def index

    @topics = Topic.all

    # return a collection of topics
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

def create

  @topic = Topic.new(topic_params)
  @topic.user = current_user

  if @topic.save
    flash[:notice] = "Topic was saved succesfully"
    redirect_to @topic
  else
    flash[:error] = "There was an error creating a Topic, please try again"
    render:new
  end
end

def edit
	    @topic = Topic.find(params[:id])
	  end

	  def update
	    @topic = Topic.find(params[:id])

	    @topic.assign_attributes(topic_params)

	    if @topic.save
	      flash[:notice] = "Topic was updated"
	      redirect_to @topic
	    else
	      flash[:error] = "Error saving topic. Please try again."
	      render :edit
	    end
	  end

	  def destroy
	    @topic = Topic.find(params[:id])

	    if @topic.destroy
	      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
	      redirect_to topics_new_path
	    else
	      flash[:error] = "There was an error deleting the topic."
	      render :show
	    end
	  end





  private

  def topic_params
    params.require(:topic).permit(:title, :user)
    end
end
