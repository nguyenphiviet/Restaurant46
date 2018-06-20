class CategoriesController < ApplicationController
  before_action :load_categories, :filter_params, only: %i(show)

  def show
    @dishes = load_dishes filter_params
  end

  private

  def filter_params
    @category = Category.find_by id: params[:id]
    not_found_page unless @category
    params.permit(:id, :min_price, :max_price, :sort_by, :page)
  end

  def load_categories
    @categories = Category.ordered_by_name
  end

  def load_dishes params
    result = @category.dishes.with_images

    result = result.send get_scope_name(params[:sort_by])

    result = result.min_price(params[:min_price]) if
      params[:min_price].present? &&
      params[:min_price].to_i > Settings.dish.price_range.min_price

    result = result.max_price(params[:max_price]) if
      params[:max_price].present? &&
      params[:max_price].to_i < Settings.dish.price_range.max_price

    result.page(params[:page]).per(Settings.paginate.dish_perpage)
  end

  def get_scope_name sort_by
    sort_list = ["most_popular_dishes", "price_asc", "price_desc",
        "name_asc", "name_desc", "newest", "oldest"]
    return sort_by if sort_by.present? && sort_list.include?(sort_by)
    return "most_popular_dishes"
  end
end
