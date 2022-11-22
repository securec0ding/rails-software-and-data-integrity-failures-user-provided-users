class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    redirect_to :controller => 'sessions', :action => 'new'
  end

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url + '?uid=' + user.id.to_s
    else
      render :html => 'login failed.'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end