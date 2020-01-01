# frozen_string_literal: true

class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:stock_ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] =
      I18n.t("flash.user_stock_added", stock_ticker: @user_stock.stock.name)
    redirect_to my_portfolio_path
  end
end
