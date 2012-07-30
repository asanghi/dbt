class MessageTemplatesController < ApplicationController
  before_filter :load_company
  before_filter :load_resource, only: [:show, :edit, :update, :destroy]

  # GET /message_templates
  # GET /message_templates.json
  def index
    @message_templates = @company.message_templates

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @message_templates }
    end
  end

  # GET /message_templates/1
  # GET /message_templates/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message_template }
    end
  end

  # GET /message_templates/new
  # GET /message_templates/new.json
  def new
    @message_template = @company.message_templates.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message_template }
    end
  end

  # GET /message_templates/1/edit
  def edit
  end

  # POST /message_templates
  # POST /message_templates.json
  def create
    @message_template = @company.message_templates.build(params[:message_template])

    respond_to do |format|
      if @message_template.save
        format.html { redirect_to [@company,@message_template], notice: 'Message template was successfully created.' }
        format.json { render json: @message_template, status: :created, location: @message_template }
      else
        format.html { render action: "new" }
        format.json { render json: @message_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /message_templates/1
  # PUT /message_templates/1.json
  def update
    respond_to do |format|
      if @message_template.update_attributes(params[:message_template])
        format.html { redirect_to [@company,@message_template], notice: 'Message template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_templates/1
  # DELETE /message_templates/1.json
  def destroy
    @message_template.destroy

    respond_to do |format|
      format.html { redirect_to company_message_templates_url(@company) }
      format.json { head :no_content }
    end
  end

  private

  def load_resource
    @message_template = @company.message_templates.find(params[:id])
  end
end
