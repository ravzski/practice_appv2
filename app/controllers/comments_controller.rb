class CommentsController < ApplicationController
  before_action :set_comment, :only=> [:show, :edit, :update, :destroy]


  def index
    @comments = Comment.all
  end


  def show
  end

  def new
    @comment = Comment.new
  end


  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.js { render :create }
      else
        format.html { render :new }
        format.js { render :error }
      end
    end
  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.js { render :update }
      else
        format.html { render :edit }
        format.js { render :error }
      end
    end
  end


  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.js { render :destroy }
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:content, :task_id)
    end

end
