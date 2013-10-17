require 'net/http'

class SessionsController < ApplicationController

  AUTH_PROVIDER_URL = 'https://api.github.com/user/orgs'

  before_action :belongs_to_organization?, only: :create

  skip_before_filter :authorize

  def create
    reset_session  #  see http://guides.rubyonrails.org/security.html#session-fixation

    user = User.find_by(provider: @auth['provider'], uid: @auth['uid']) ||
           User.create_with_omniauth(@auth)

    session[:user_uid] = user.uid
    session[:name] = user.name ||
                     user.email ||
                     'fellow Ruby on Rails enthusiast'

    redirect_to root_path, :notice => "Welcome #{session[:name]}!"
  end

  def destroy
    reset_session
    flash[:notice] = 'Logged out.'
    redirect_to events_path
  end

  private

  def belongs_to_organization?
    @auth = request.env['omniauth.auth']

    url = "#{AUTH_PROVIDER_URL}?access_token=#{@auth[:credentials][:token]}"
    groups_request = HTTParty.get(url)

    organizations = groups_request.map{ |x| x['login'] }
    failure unless organizations.include?(API_GITHUB_CONFIG['organization'])
  end

  def failure
    redirect_to login_url, :alert => 'Sorry, there was something wrong with your login attempt. Please try again.'
  end
end
