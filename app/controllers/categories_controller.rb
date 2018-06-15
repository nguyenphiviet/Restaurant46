class CategoriesController < ApplicationController
  before_action :load_categories, :filter_params, only: %i(show)

  def show
    @dishes = load_dishes filter_params
  end

  private

  def filter_params
    @category = Category.find_by id: params[:id]
    not_found_page unless @category
    params.permit :id, :page
  end

  def load_categories
    @categories = Category.ordered_by_name
  end

  def load_dishes filter_params
    @category.dishes.with_images
      .page(filter_params[:page]).per(Settings.paginate.dish_perpage)
  end
end
