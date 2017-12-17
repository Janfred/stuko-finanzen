class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :development_sign_in

  rescue_from CanCan::AccessDenied do |exception|
    if can? :read, exception.subject
      redirect_to exception.subject, :alert => exception.message
    else
      redirect_to root_url, :alert => exception.message
    end
  end

  private

  def development_sign_in
    sign_in User.first if Rails.env.development?
  end
end
