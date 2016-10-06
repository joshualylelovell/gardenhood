class ToolsController < ApplicationController
  before_action :authenticate_gardener!
  before_action :set_tool, only: [:edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def index
    @tools = Tool.order(created_at: :desc)
    @gardeners = Gardener.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def edit
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.gardener = current_gardener
    respond_to do |format|
      if @tool.save
        format.html { redirect_to tools_path, notice: 'Tool is now in your shed.' }
        format.json { render :show, status: :created, location: @tool }
      else
        format.html { render :new }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tool.update(tool_params)
        format.html { redirect_to @tool, notice: 'Your tool was successfully updated.' }
        format.json { render :show, status: :ok, location: @tool }
      else
        format.html { render :edit }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tool.destroy
    respond_to do |format|
      format.html { redirect_to tools_url, notice: 'Your tool is gone.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints.
  def set_tool
    @tool = Tool.find(params[:id])
    redirect_to root_url, notice: 'Access Denied!' unless current_gardener.id == @tool.gardener.id
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tool_params
    params.require(:tool).permit(:name, :details, :available, :requested)
  end

  # Set S3 Post
  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/tools/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
