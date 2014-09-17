class TasksController < ApplicationController
  before_action :set_task, :only=> [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end


  def show
  end

  def new
    @task = Task.new
  end


  def edit
    @comment = Comment.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.js { render :create }
      else
        format.html { render :new }
        format.js { render :error }
      end
    end
  end


  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.js { render :update }
      else
        format.html { render :edit }
        format.js { render :error }
      end
    end
  end


  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.js { render :destroy }
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end


    def task_params
      params.require(:task).permit(:body, :title)
    end

end
