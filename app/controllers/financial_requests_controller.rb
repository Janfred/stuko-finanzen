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

    respond_to do |format|
      if @financial_request.save
        format.html { redirect_to @financial_request, notice: 'Financial Request was successfully created.' }
        format.json { render :show, status: :created, location: @financial_request }
      else
        format.html { render :new }
        format.json { render json: @financial_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @financial_request.update(financial_request_params)
        format.html { redirect_to @financial_request, notice: 'Financial Request was successfully updated.' }
        format.json { render :show, status: :updated, location: @financial_request }
      else
        format.html { render :edit }
        format.json { render json: @financial_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @financial_request.destroy
    respond_to do |format|
      format.html { redirect_to financial_requests_url, notice: 'Financial Request was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private

  def set_financial_request
    @financial_request = FinancialRequest.find(params[:id])
  end

  def financial_request_params
    params.require(:financial_request).permit(:name, :applicant, :requested_sum, :date, :done, :agenda_item, :meeting_id)
  end
end
