class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      render "new"
    end
  end

  def company_params
    params.require(:company).permit(:name, :url, :employees_count, :total_funding, :stage, :year_founded, :qualification)
  end
  
end