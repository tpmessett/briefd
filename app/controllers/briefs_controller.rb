class BriefsController < ApplicationController
  before_action :set_brief, only: [:show, :edit, :update, :destroy]
  before_action :check_user_company_association, only: [:show, :edit, :update, :destroy]


  # GET /briefs
  def index
    @briefs = Brief.joins(:company).where(companies: { id: current_user.company_ids })
  end

  # GET /briefs/1
  def show
  end

  # GET /briefs/new
  def new
    @brief = Brief.new
  end

  # GET /briefs/1/edit
  def edit
  end

  # POST /briefs
  def create
    @brief = Brief.new(brief_params)

    if @brief.save
      redirect_to @brief, notice: 'Brief was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /briefs/1
  def update
    if @brief.update(brief_params)
      redirect_to @brief, notice: 'Brief was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /briefs/1
  def destroy
    @brief.destroy
    redirect_to briefs_url, notice: 'Brief was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brief
      @brief = Brief.find(params[:id])
    end

    def check_user_company_association
      unless current_user.companies.include?(@brief.company)
        redirect_to root_path, alert: 'You are not authorized to access this brief.'
      end
    end

    # Only allow a list of trusted parameters through.
    def brief_params
      params.require(:brief).permit(:responses, :brief_template_id, :user_id, :client_id, :created_at, :updated_at, :goal_framework, :client_score, :company_score, :brief_score, :total_score, :client_notes, :company_notes, :brief_notes, :archived_at)
    end
end
