class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :create]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user

    if @task.save
      redirect_to @task, notice: "Task has been created successfully"
    else
      puts @task.errors.full_messages # Debug output to check validation errors
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task has been updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "Task has been deleted"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :user_id)
  end
end