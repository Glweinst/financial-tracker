class UserStocksController < ApplicationController
  # Any changes in this association controller address associations! For example, a destroy function
  # here has no bearing on the data of the user or the stock, but it will delete a relationship between the two
  
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:stock_ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{@user_stock.stock.name} was successfully added to your portfolio"
    redirect_to root_path
  end
  
  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy
    flash[:notice] = "Stock was successfully removed from portfolio"
    redirect_to root_path
  end
  
end