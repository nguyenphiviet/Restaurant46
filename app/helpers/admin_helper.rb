module AdminHelper
  def format_currency number
    number_to_currency number,
      precision: 0, unit: Settings.currency_unit,
      separator: ",", delimiter: ".", format: "%n %u"
  end

  def format_datetime datetime
    datetime.strftime("%d %b, %Y")
  end

  def truncate_html html, limit
    HTML_Truncator.truncate(html, limit).html_safe
  end
end
