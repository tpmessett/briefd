class BriefTemplatesController < ApplicationController
  before_action :set_brief_template, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user_for_brief_template, only: [:show, :edit, :update]

  # GET /brief_templates
  def index
    @company = current_user.companies.find(params[:company_id])
    @brief_templates = @company.brief_templates
  end

  # GET /brief_templates/1
  def show
  end

  # GET /brief_templates/new
  def new
    @brief_template = BriefTemplate.new
  end

  # GET /brief_templates/1/edit
  def edit
  end

  # POST /brief_templates
  def create
    @brief_template = BriefTemplate.new(brief_template_params)

    if @brief_template.save
      redirect_to @brief_template, notice: 'Template was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /brief_templates/1
  def update
    if @brief_template.update(brief_template_params)
      redirect_to @brief_template, notice: 'Template was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /brief_templates/1
  def destroy
    if current_user.is_admin == true || current_user.user_type == "admin"
      @brief_template.destroy
      redirect_to brief_templates_path, notice: 'Template was successfully deleted.'
    else
      redirect_to rief_templates_path, notice: 'You are not authorised to do that'
    end
  end

  private

    def authorize_user_for_brief_template
      unless @brief_template.company == current_user.company
        redirect_to root_path, alert: 'You are not authorized to view this brief template.'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_brief_template
      @brief_template = current_user.company.brief_templates.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brief_template_params
      params.require(:brief_template).permit(:name, :type, :fields, :company_id, :user_id, :client_id, :internal, :global_brief_template_id, :goal_framework, :approval_flow, :archived_at)
    end
end
