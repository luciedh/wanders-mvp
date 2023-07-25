class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to new_place_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to new_place_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
