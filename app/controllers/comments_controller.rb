class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @story = Story.find(params[:story_id])
    @comment = @story.comments.build
  end

  def create
    @comment = Story.find(params[:story_id]).comments.build(params[:comment])
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'Successfully submitted comment'}
      else
        format.html { render 'new' }
      end
    end
  end

end
