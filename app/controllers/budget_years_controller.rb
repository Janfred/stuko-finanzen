class BudgetYearsController < ApplicationController
  before_action :set_budget_year, only: [:show, :edit, :update, :destroy]

  def index
    @budget_years = BudgetYear.all
  end

  def show
  end

  def new
    @budget_year = BudgetYear.new
  end

  def edit
  end

  def create
    @budget_year = BudgetYear.new(budget_year_params)

    if @budget_year.save
      redirect_to @budget_year, notice: 'Budget year was successfully created.'
    else
      render :new
    end
  end

  def update
    if @budget_year.update(budget_year_params)
      redirect_to @budget_year, notice: 'Budget year was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @budget_year.destroy
    redirect_to budget_years_url, notice: 'Budget year  was successfully destroyed.'
  end

  private

  def set_budget_year
    @budget_year = BudgetYear.find(params[:id])
  end

  def budget_year_params
    params.require(:budget_year).permit(:name, :budget, :additional_budget)
  end

end
