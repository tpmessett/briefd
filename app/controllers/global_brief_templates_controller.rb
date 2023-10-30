class GlobalBriefTemplatesController < ApplicationController
  before_action :set_global_brief_template, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  # GET /global_brief_templates
  def index
    @global_brief_templates = GlobalBriefTemplate.all
  end

  # GET /global_brief_templates/1
  def show
  end

  # GET /global_brief_templates/new
  def new
    @global_brief_template = GlobalBriefTemplate.new
  end

  # GET /global_brief_templates/1/edit
  def edit
  end

  # POST /global_brief_templates
  def create
    @global_brief_template = GlobalBriefTemplate.new(global_brief_template_params)

    if @global_brief_template.save
      redirect_to @global_brief_template, notice: 'Global brief template was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /global_brief_templates/1
  def update
    if @global_brief_template.update(global_brief_template_params)
      redirect_to @global_brief_template, notice: 'Global brief template was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /global_brief_templates/1
  def destroy
    @global_brief_template.destroy
    redirect_to global_brief_templates_url, notice: 'Global brief template was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_global_brief_template
    @global_brief_template = GlobalBriefTemplate.find(params[:id])
  end

  # Ensure the user is an admin.
  def authorize_admin
    redirect_to root_path, alert: 'Only admins can perform this action.' unless current_user.is_admin?
  end

  # Only allow a list of trusted parameters through.
  def global_brief_template_params
    params.require(:global_brief_template).permit(:name, :template_type, :fields, :goal_framework, :archived_at)
  end
end
