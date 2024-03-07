class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = current_user.tasks
    @tasks_today = @tasks.where(due_date: Date.today)
    @completed_tasks = @tasks.where(completed: true)
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

end
