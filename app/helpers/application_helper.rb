module ApplicationHelper
  def show_image dish
    if dish.images.present?
      image_tag dish.images.first.url.url,
      size: Settings.dish.img_lastest_size, class: "img-responsive"
    else
      image_tag Settings.dish.default_lastest_image
    end
  end

  def show_image_sm dish
    if dish.images.present?
      image_tag dish.images.first.url.url,
      size: Settings.dish.img_sm_size, class: "img-responsive"
    else
      image_tag Settings.dish.default_image
    end
  end

  def currency_format number
    number_to_currency number,
      precision: 0, unit: Settings.currency_unit,
      separator: ",", delimiter: "."
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

  def truncate_html html, limit
    HTML_Truncator.truncate(html, limit).html_safe
  end

  def dish_image dish
    if dish.images.present?
      image_tag dish.images.first.url, size: Settings.dish.img_sm_size
    else
      image_tag Settings.dish.default_image
    end
  end

  def format_currency number
    number_to_currency number,
      precision: 0, unit: Settings.currency_unit,
      separator: ",", delimiter: ".", format: "%n %u"
  end

  def not_found_page
    respond_to do |format|
      format.html {render file: "public/404.html", layout: true}
    end
  end
end
