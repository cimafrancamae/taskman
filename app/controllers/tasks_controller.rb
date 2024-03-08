class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_all
  before_action :set_task, only: %i[show edit update destroy mark_complete]

  def index
    if params[:tasks_today] == "true"
      @tasks = current_user.tasks.where("due_date = ? AND completed = ?", Date.today, false)
      render "tasks/_tasks_today"
    elsif
      params[:completed] == "true"
      @tasks = current_user.tasks.where(completed: true)
    else
      @tasks = current_user.tasks.all
    end
  end

  def mark_complete
    @task.update(completed: true)
    redirect_to @task, notice: 'Task marked as complete.'
  end

  def create
    puts current_user
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to tasks_path, notice: "Task saved successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @task = Task.new

    if params[:category_id]
      @task = Task.new(category_id: params[:category_id])
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to :tasks, notice: "Task updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "Task deleted successfully."
  end

  def show; end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :due_date, :completed, :category_id).merge(user_id: current_user.id)
  end

  def set_all
    @categories = current_user.categories
    @tasks = current_user.tasks
    @tasks_today = current_user.tasks.where("due_date = ? AND completed = ?", Date.today, false)
    @completed_tasks = current_user.tasks.where(completed: true)
  end

end
