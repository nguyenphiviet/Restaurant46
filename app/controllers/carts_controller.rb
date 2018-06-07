class CartsController < ApplicationController

  def index; end

  def destroy
    session[:reservation]["detail"].delete_if {|key, value| key == params[:id]}
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def update
    quantity_update = params["quantity"].to_i
    session[:reservation]["detail"][params[:id].to_s]["quantity"] = quantity_update
    @total_price_item = quantity_update.to_i * session[:reservation]["detail"][params[:id].to_s]["dish_price"].to_i
    respond_to do |format|
      format.js
      format.html{redirect_to request.referrer}
    end
  end
end
