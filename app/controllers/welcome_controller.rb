class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to budget_years_path
    end
  end
end
