class HomeController < ApplicationController
  def index
    @categories = Category.all
    @tasks = Task.all
    @tasks_today = @tasks.where(due_date: Date.today)
    @completed_tasks = @tasks.where(completed: true)
  end
end
