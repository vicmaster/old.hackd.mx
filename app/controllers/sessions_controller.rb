require 'net/http'

class SessionsController < ApplicationController  
  def new
  end  

  def create
    reset_session  #  see http://guides.rubyonrails.org/security.html#session-fixation
    info = request.env["omniauth.auth"]

    belongs_to_organization? info["credentials"]["token"] 
    session[:name] = info["info"]["name"] || info["info"]["email"] || info["info"]["nickname"] || "fellow Ruby on Rails enthusiast"


    redirect_to events_path, :notice => "Welcome #{session[:name]}!"
  end

  def failure
    redirect_to login_url, :alert => 'Sorry, there was something wrong with your login attempt. Please try again.'
  end

  def destroy  
    reset_session  
    flash[:notice] = "Logged out." 
    redirect_to events_path 
  end

  private
  def belongs_to_organization? token
    url = "https://api.github.com/user/orgs?access_token=#{token}"
    @organizations = HTTParty.get(url)
    @organizations.map!{|x| x["login"]}.include? API_GITHUB_CONFIG['organization']
  end
end
