class HomeController < ApplicationController
  before_action :set_all

  def index; end

  private

  def set_all
    @categories = current_user.categories
    @tasks = current_user.tasks.order(due_date: :desc)
    @tasks_today = current_user.tasks.where("(due_date = ? OR due_date < ?) AND (completed IS NULL OR completed = ?)", Date.today, Date.today, false)
    @completed_tasks = current_user.tasks.where(completed: true)
  end
end
