class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_account

  def set_account
    @subdomain = request.subdomain
    @account = Account.find_by(subdomain: @subdomain)
  end

end
