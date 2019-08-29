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
    resp = Faraday.post("https://api.github.com/#{params[:login]}/repos") do |req|
      req.headers['Authorization'] = "token #{ session[:token] }"
      req.headers['Accept'] = 'application/json'
      req.body = {
                  "name": params[:name],
                  "description": "Test repo for rails github api lab",
                  "homepage": "https://github.com",
                  "private": false,
                  "has_issues": true,
                  "has_projects": true,
                  "has_wiki": true
                }
    end

    body = JSON.parse(resp.body)

    redirect_to root_path, flash: {message: body}

  end

end
