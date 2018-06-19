class ReservationsController < ApplicationController

  def create
    unless session[:reservation].present?
      session[:reservation] = {}
      date_start = params[:reservations][:date_start]
      hour = params[:reservations]["time_start(4i)"]
      minute = params[:reservations]["time_start(5i)"]
      time_start = date_start + " " + hour + ":" + minute
      session[:reservation].merge!({"table"=>{"table_id"=>params[:reservations][:table_id], "price"=>params[:reservations][:table_id],"time_start"=>time_start}})
      flash[:success] = t "reserved_table"
      redirect_to dishes_path
    else
      flash[:success] = t "reserved_table_again"
    end
  end
end
