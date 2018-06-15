class CategoriesController < ApplicationController
  before_action :load_categories, :filter_params, only: %i(show)

  def show
    @dishes = load_dishes filter_params
  end

  private

  def filter_params
    unless params[:id] == "all"
      @category = Category.find_by id: params[:id]
      not_found_page unless @category
    end
    params.permit(:id, :min_price, :max_price, :sort_by, :page)
  end

  def load_categories
    @categories = Category.ordered_by_name
  end

  def load_dishes params
    # result = nil
    result = (params[:id] == "all") ? Dish.with_images : @category
      .dishes.with_images

    sort_arr = [:most_popular_dishes, :price_asc, :price_desc,
        :name_asc, :name_desc, :newest, :oldest]
    if params[:sort_by] && sort_arr.include?(params[:sort_by].to_sym)
      result = result.send(params[:sort_by].to_sym)
    else
      result = result.most_popular_dishes
    end

    result.page(params[:page]).per(Settings.paginate.dish_perpage)
  end
end
