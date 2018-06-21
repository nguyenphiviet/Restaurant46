class TablesController < ApplicationController
  before_action :load_categories, only: %i(index show)

  def index
    @q = Table.ransack(params[:q])
    @tables = @q.result.page(params[:page]).per(Settings.paginate.table_perpage) if @q.result
  end

  def show
    @booking = Booking.new
    @table = Table.find_by id: params[:id]
    return if @table
    flash[:danger] = t ".cant_find"
    redirect_to root_url
  end

  private

  def load_categories
    @categories = Category.ordered_by_name
  end
end
