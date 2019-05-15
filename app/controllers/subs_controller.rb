class SubsController < ApplicationController
  # before_action :set_sub, except: [:index, :new, :create]
  before_action :set_sub, only: [:show, :edit, :update, :destroy]


  def index
    @subs = Sub.all 
    # render :index 
  end

  def show
    #render :show 
  end

  def new
    @sub = Sub.new
    render partial: "form" 
    # render: new 
  end

  def create
    @sub = Sub.new(sub_params) #created an instance that is not saved
    if @sub.save 
      redirect_to @sub 
      # will assume you're referencing -> 
      #sub_path(@sub.id) 
      #sub_path(@sub) 
      #@sub 
    else 
      render :new 
    end 
  end 

  def edit
    # render :edit 
    render partial: "form" 
  end

  def update 
    if @sub.update(sub_params)
      redirect_to sub_path(@sub.id)
    else
      render :edit 
    end 
  end 

  def destroy 
    @sub.destroy 
    redirect_to subs_path
  end 

  private 
  # Everything under private will be a private method 
  # can only access this method inside the file 
  def sub_params
    # params = {sub: { name: "Sub Name"}}
    params.require(:sub).permit(:name)
  end 

  def set_sub
    # url = /subs/2(:id)
    #params = {id: 2}
    @sub = Sub.find(params[:id])
  end 
end
