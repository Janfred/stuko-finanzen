class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :development_sign_in

  private

  def development_sign_in
    sign_in User.first
  end
end
