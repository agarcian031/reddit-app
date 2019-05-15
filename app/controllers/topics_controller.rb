class TopicsController < ApplicationController
  before_action :set_sub 
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  def index
    @topics = @sub.topics 
  end
  
  def show
  end
  
  def new
    @topic = @sub.topics.new 
    render partial: "form" #will look for partial in topics folder, not sub
  end

  def create 
    @topic = @sub.topics.new(topic_params)

    if @topic.save 
      redirect_to sub_topic_path(@sub.id, @topic.id)
      # redirect_to sub_topic_path(@sub, @topic) 
      # redirect_to [@sub, @topic]
    else
      render partial: "form"
    end 
  end 
  
  def edit
    render partial: "form" #will look for partial in topics folder, not sub
    
  end

  def update
    if @topic.update(topic_params)
      redirect_to sub_topic_path(@sub, @topic)
    else
      render partial: "form"
    end 
  end 

  def destroy
    @topic.destroy 
    redirect_to sub_topics_path(@sub.id) #dont need a topics id because we'll be looking at all the topics, not just one. 
  end 
  
  private 
  def set_sub
    @sub = Sub.find(params[:sub_id])    
  end 
  
  def set_topic
    @topic = Topic.find(params[:id]) 

    # @topic = @sub.topics.find(params[:id])
    #we know the topic id, so we don't need to worry about the sub_id
  end 

  def topic_params
    params.require(:topic).permit(:name, :body)
  end 
end
