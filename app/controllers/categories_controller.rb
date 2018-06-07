class CategoriesController < ApplicationController

  def show
    @dishes = Dish.find_by id: params[:id]
  end
end
