class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
    # definition of session
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    
    def increment_count
      # if session[:counter].nil?
      #   session[:counter] = 1
      # end
      session[:counter] ||= 1
      session[:counter] += 1
    end
  
end
