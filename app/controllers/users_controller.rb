class UsersController < ApplicationController

  helper_method :current_user_session, :current_user

  respond_to :html, :json
  skip_before_filter  :verify_authenticity_token, :on => :register_user

  def index
    p "index current_user #{current_user}"
    @user = User.find(params[:id])
    @current_user = current_user
    p current_user
    respond_with @user
  end

  def register_user
    @user = User.new(params[:user])
    if @user.save
      respond_with @user
    end
  end

  def show_current_user
    p "show  current_user #{current_user.username}"
    @users = User.all
    a = []
    @json = [current_user.username, @users].each {|v| a << v}
    #respond_with({:users => @users, :current_user => current_user})
    respond_with @json
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end


end
