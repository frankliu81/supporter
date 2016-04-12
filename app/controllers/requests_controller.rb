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
     @requests = Request.order('status DESC').page(params[:page]).per(7)
     #byebug;
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

  def search
    #@requests = Request.all
    @requests = Request.search(params[:search]).page(params[:page]).per(7)
  end

  def status_change

    #@request = Request.find params[:id_status_change]

    # change to link_to with :id
    @request = Request.find params[:id]

    if @request.status == 'Not Done'
       @request.status = 'Done'
    elsif @request.status == 'Done'
      @request.status = 'Not Done'
    else
      @request.status = 'Not Done'
    end

    @request.save

    redirect_to requests_path

  end


end
