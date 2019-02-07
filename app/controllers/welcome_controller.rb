class WelcomeController < ApplicationController

  def show
    puts params[:user_entry]
  end
end 
