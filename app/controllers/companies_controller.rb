class CompaniesController < ApplicationController
  before_action :check_admin, only: :destroy

  def create
    @company = Company.new(company_params)
    puts   company_params
    # added to ensure user gets saved or roll back
    ActiveRecord::Base.transaction do
      if @company.save
        # Create a company assignment for the current user
        CompanyAssignment.create!(user: current_user, company: @company)
        redirect_to @company, notice: 'Company was successfully created.'
      else
        render :new
      end
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully deleted.'
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name, :plan, :business_field, :business_type)
  end

  def check_admin
    unless current_user.is_admin?
      redirect_to companies_url, alert: 'You are not authorized to delete this company.'
    end
  end
end
