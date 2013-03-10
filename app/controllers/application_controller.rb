class ApplicationController < ActionController::Base
  protect_from_forgery

  protect_from_forgery

  before_filter :intercept_html_requests

  helper_method :current_user_session, :current_user


  private

  def intercept_html_requests
    render('users/index') if request.format == Mime::HTML
  end



  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

end
