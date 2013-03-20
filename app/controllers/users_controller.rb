class UsersController < ApplicationController

  #helper_method :current_user_session, :current_user

  respond_to :html, :json
  skip_before_filter  :verify_authenticity_token, :on => :register_user

  def index
    @user_logged_in = user_logged_in?
    @users = User.count
    data_hash = []; [@users, @user_logged_in].each {|value| data_hash << value}
    p "hash 1 #{data_hash[1]}"
    respond_with data_hash
  end

  def register_user
    @user = User.new(params[:user])
    if @user.save
      respond_with @user
    end
  end

  def show_current_user
    @users = User.all
    a = []
    @json = [current_user.username, @users].each {|v| a << v}
    #respond_with({:users => @users, :current_user => current_user})
    respond_with @json
  end

  def user_logged_in
    @user = @current_user
    respond_with @user
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


  def user_logged_in?
    unless current_user.nil?
      return true
    else
      @user = 'not logged in'
      return false
    end
  end

end
