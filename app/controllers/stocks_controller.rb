# frozen-string-literal: true

class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:alert] = I18n.t("flash.search_empty")
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:alert] = I18n.t("flash.search_incorrect_symbol") unless @stock
    end
    respond_to do |format|
      format.js { render partial: "users/result" }
    end
  end
end
