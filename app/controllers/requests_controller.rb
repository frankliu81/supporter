class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    request_params = params.require(:request).permit(:name, :email, :department, :message)
    @request = Request.new(request_params)

    if @request.save
      #render text: "SUCCESS"
      redirect_to request_path(@request)
    else
      #render text: "FAILURE"
      render :new
    end
  end

  def show
    @request = Request.find params[:id]
  end

  def index
    #@requests = Request.all
     @requests = Request.order('created_at').page(params[:page]).per(7)
     #byebug;
  end

  def search
    #@requests = Request.all
    @requests = Request.search(params[:search]).page(params[:page]).per(7)

  end

  def edit
    @request = Request.find params[:id]
  end

  def update
    @request = Request.find params[:id]
    request_params = params.require(:request).permit([:name, :email, :department, :message])

    if @request.update request_params
      redirect_to request_path(@request)
    else
      render :edit
    end
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to requests_path
  end

end
