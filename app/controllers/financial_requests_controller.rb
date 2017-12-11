class FinancialRequestsController < ApplicationController
  before_action :set_financial_request, only: [:show, :edit, :update, :destroy]

  def index
    @financial_requests = FinancialRequest.all
  end

  def show
  end

  def new
    @financial_request = FinancialRequest.new
  end

  def edit
  end

  def create
    @financial_request = FinancialRequest.new(financial_request_params)

    if @financial_request.save
      redirect_to @financial_request, notice: 'Financial Request was successfully created.'
    else
      render :new
    end
  end

  def update
    if @financial_request.update(financial_request_params)
      redirect_to @financial_request, notice: 'Financial Request was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @financial_request.destroy
    redirect_to financial_requests_url, notice: 'Financial Request was successfully destroyed'
  end

  private

  def set_financial_request
    @financial_request = FinancialRequest.find(params[:id])
  end

  def financial_request_params
    params.require(:financial_request).permit(:name, :applicant, :requested_sum, :date, :done, :agenda_item, :meeting_id)
  end
end
