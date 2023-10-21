class CompaniesController < ApplicationController
   before_action :set_company, only: [:edit, :update, :destroy]
  before_action :check_admin, only: :destroy

  def create
    @company = Company.new(company_params)

    if @company.save
      # Create a company assignment for the current user
      CompanyAssignment.create!(user: current_user, company: @company)
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  def edit
    # The edit view will use @company to populate the form fields.
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully deleted.'
  end

  private

  def company_params
    params.require(:company).permit(:name, :plan, :business_field, :business_type)
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def check_admin
    unless current_user.is_admin?
      redirect_to companies_url, alert: 'You are not authorized to delete this company.'
    end
  end
end
