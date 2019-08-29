class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.headers['Authorization'] = "token #{ session[:token] }"
      req.headers['Accept'] = 'application/json'
    end
    body = JSON.parse(resp.body)
    @login = body['login']

  end

  def create
    resp = Faraday.post("https://api.github.com/user/repos") do |req|
      req.headers['Authorization'] = "token #{ session[:token] }"
      req.headers['Accept'] = 'application/json'
      req.params['name'] = params[:name]
    end
    redirect_to root_path

  end

end
