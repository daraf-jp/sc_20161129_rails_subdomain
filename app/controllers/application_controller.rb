class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_account

  def set_account
    @subdomain = request.subdomain
    @account = Account.find_by(subdomain: @subdomain)
  end

  # http://codenote.net/ruby/rails/1693.html
  def redirect_no_subdomain
    unless @subdomain.empty?
      redirect_to url_for(subdomain: false)
    end
  end

  def redirect_to_root
    if @account.present?
      redirect_to root_url(subdomain: false)
      return
    end
  end

end
