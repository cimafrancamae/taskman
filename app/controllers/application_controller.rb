class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_all, if: :user_signed_in?

  def set_all
    @categories = current_user.categories
    @tasks = current_user.tasks.where("completed IS NULL OR completed = ?", false).order(created_at: :desc)
    @tasks_today = current_user.tasks.where("(due_date = ? OR due_date < ?) AND (completed IS NULL OR completed = ?)", Date.today, Date.today, false)
    @completed_tasks = current_user.tasks.where(completed: true)
  end
end
