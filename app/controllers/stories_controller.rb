class StoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :latest]

  def index
    puts can? :update, Story.last
    @stories = Story.limit(50).all
  end

  def new 
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])
    @story.user = current_user
    respond_to do |format|
      if @story.save
        format.html { redirect_to root_path, notice: 'Successfully submitted course' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def latest
    @stories = Story.latest
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to root_path, notice: 'Successfully updated course' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    Story.find(params[:id]).destroy
    redirect_to root_path, notice: 'Successfully removed course'
  end

  def up
    @story = Story.find(params[:id])
    up = @story.up.nil? ? 1 : @story.up + 1
    @story.update_attribute('up', up)
    redirect_to root_path, notice: 'Successfully voted up course'
  end

  def down
    @story = Story.find(params[:id])
    up = @story.down.nil? ? 1 : @story.down + 1
    @story.update_attribute('down', down)
    redirect_to root_path, notice: 'Successfully voted down course'
  end
end
