class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :development_sign_in

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def development_sign_in
    sign_in User.first
  end
end
