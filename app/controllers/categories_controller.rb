class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index; end

  def show; end

  def create
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
      redirect_to @category, notice: "Category updated successfully."
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

end
