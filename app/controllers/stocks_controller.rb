class StocksController < ApplicationController
  
  def search    #this method passes all stock info to @stock unless search is wacky
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an incorrect symbol" if !@stock
    end
    render partial: 'users/result'
  end
  
end