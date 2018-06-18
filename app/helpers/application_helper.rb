module ApplicationHelper
  def show_image dish
    dish = Dish.find_by id: dish.id
    if dish
      image_tag(dish.images.first.url, class: "img-responsive") if dish.images.present?
    end
  end

  def currency_format number
    number_to_currency(number, separator: ",", delimiter: ".")
  end

  def current_cart
    session[:reservation]
  end

  def bookingdetails_exist?
    session[:reservation] && session[:reservation]["detail"]
  end

  def total_cart
    total = 0
    if session[:reservation]["detail"]
      session[:reservation]["detail"].each do |key, value|
        total += (value["dish_price"].to_i * value["quantity"].to_i)
      end
    end
    total
  end

  def total_price_item item_price, quantity
    item_price.to_i * quantity.to_i
  end
end
