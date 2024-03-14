class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy mark_complete]

  def index
    if params[:tasks_today] == "true"
      @tasks = current_user.tasks.where("due_date = ? AND (completed IS NULL OR completed = ?)", Date.today, false)
      render "tasks/_tasks_today"
    elsif
      params[:completed] == "true"
      @tasks = current_user.tasks.where(completed: true)
    else
      @tasks = @tasks
    end
  end

  def mark_complete
    @task.update(completed: true)
    redirect_to task_path, notice: 'Task marked as complete.'
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: "Task saved successfully." }
        format.turbo_stream { flash[:notice] = "Task saved successfully."}
      end
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
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: "Task updated successfully." }
        format.turbo_stream { flash[:notice] = "Task updated successfully."}
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      # format.html { redirect_to tasks_path, notice: "Task deleted successfully." }
      format.html { redirect_back fallback_location: tasks_path, notice: "Task deleted successfully." }
      format.turbo_stream { flash[:notice] = "Task deleted successfully." }
    end
  end

  def show; end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_back fallback_location: tasks_path, alert: "Sorry, task not found."
  end

  def task_params
    params.require(:task)
      .permit(:title, :content, :due_date, :completed, :category_id)
      .merge(user_id: current_user.id)
  end
end
