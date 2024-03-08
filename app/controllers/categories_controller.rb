class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_all
  before_action :set_category, only: %i[show edit update destroy]

  def index; end

  def show; end

  def create
    puts category_params
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to @category, notice: "Category saved successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @category = Category.new
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to :categories, notice: "Category updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to :categories, notice: "Category deleted successfully."
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def set_all
    @categories = current_user.categories.all.order(created_at: :desc)
    @tasks = current_user.tasks.all.order(due_date: :desc)
    @tasks_today = current_user.tasks.where("due_date = ? AND completed = ?", Date.today, false)
    @completed_tasks = current_user.tasks.where(completed: true)
  end

end
