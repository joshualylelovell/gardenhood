class RequestsController < ApplicationController

  before_action :authenticate_gardener!
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.order(created_at: :desc)
    @tools = current_gardener.tools.order(created_at: :desc)
    @tools_user = Tool.all
    @gardeners = Gardener.all

  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
    @request.tool = Tool.find(params[:tool])
  end

  def create
    @request = Request.new(request_params)
    @request.gardener = current_gardener
    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, notice: 'Your request has been saved.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Your request has been updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_path, notice: 'Your request is gone.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints.
  def set_request
    @request = Request.find(params[:id])
    redirect_to root_url, notice: 'Access Denied!' unless current_gardener.id == @request.gardener.id
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:start_date, :end_date, :notes, :status, :tool_id)
  end

  def set_approved
    @request = Request.find(params[:id])
    puts "request:"
    puts @request
    @request.status = "approved"
    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, notice: 'Your request has been updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :index, notice: 'Request update failed.' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_denied
    @request = Request.find(params[:id])
    puts "request:"
    puts @request
    @request.status = "denied"
    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, notice: 'Your request has been updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :index, notice: 'Request update failed.' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

end
