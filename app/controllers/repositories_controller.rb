class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.body = {Authorization: "token #{ session[:token] }"}
      req.header['Accept'] = 'application/json'
    end 
    
    
  end

  def create

  end

end
