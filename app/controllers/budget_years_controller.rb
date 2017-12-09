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

    respond_to do |format|
      if @budget_year.save
        format.html { redirect_to @budget_year, notice: 'Budget year was successfully created.' }
        format.json { render :show, status: :created, location: @budget_year }
      else
        format.html { render :new }
        format.json { render json: @budget_year.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @budget_year.update(budget_year_params)
        format.html { redirect_to @budget_year, notice: 'Budget year was successfully created.' }
        format.json { render :show, status: :created, location: @budget_year }
      else
        format.html { render :new }
        format.json { render json: @budget_year.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
   @budget_year.destroy
    respond_to do |format|
      format.html { redirect_to budget_years_url, notice: 'Budget year  was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_budget_year
    @budget_year = BudgetYear.find(params[:id])
  end

  def budget_year_params
    params.require(:budget_year).permit(:name, :budget, :additional_budget)
  end

end
