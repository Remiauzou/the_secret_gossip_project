class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @gossips = []
    @users = @city.users
    @users.each do |u|
      u.gossips.each do |g|
        @gossips << g
      end
    end
    puts @gossips
  end
end
