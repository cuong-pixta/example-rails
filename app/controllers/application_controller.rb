class ApplicationController < ActionController::Base
  before_action :set_locale
  
  include SessionsHelper
  
  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options 
      { locale: I18n.locale }
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "You must be logged in first"
        redirect_to login_url
      end
    end

end
