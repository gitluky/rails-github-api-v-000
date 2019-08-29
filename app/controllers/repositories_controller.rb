class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.header['Authorization'] = "token #{ session[:token] }"}
      req.header['Accept'] = 'application/json'
    end
    @body = JSON.parse(resp.body)


  end

  def create

  end

end
