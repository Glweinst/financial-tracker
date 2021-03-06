class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships
  
  
  # Handling first and last name as full name in form submission
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name) #strip method just removes blanks before and after names
    "Anonymous"
  end
  
  # Handling listing of stocks on my_portfolio page
  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end
  
  def under_stock_limit?
    user_stocks.count < 10
  end
  
  def can_add_stock?(ticker_symbol)
    under_stock_limit? and !stock_already_added?(ticker_symbol)
  end  
 
end
