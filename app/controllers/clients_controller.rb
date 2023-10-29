class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_company
  before_action :check_admin_or_company_admin, only: :destroy

  def index
    @clients = @company.clients
  end

  def show
  end

  def new
    @client = @company.clients.new
  end

  def create
    @client = @company.clients.new(client_params)
    ActiveRecord::Base.transaction do
      if @client.save
        ClientAssignment.create!(user: current_user, client: @client)
        redirect_to [@company, @client], notice: 'Client was successfully created.'
      else
        render :new
      end
    end
  end

  def edit
    puts "edit"
  end

  def update
    if @client.update(client_params)
      redirect_to company_client_path(@company, @client), notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to company_clients_path(@company), notice: 'Client was successfully deleted.'
  end

  private

  def set_client
    @client = Client.find(params[:id])
    puts @client
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def client_params
    params.require(:client).permit(:name, :compulsory_fields, :notes, :archived_at)
  end

  def check_admin_or_company_admin
    unless current_user.user_type == 'admin' || current_user.is_admin == true
      redirect_to companies_url, alert: 'You are not authorized to delete this company.'
    end
  end
end
