class AnalyticsController < ApplicationController
  before_action :set_analytic, only: [:show, :edit, :update, :destroy]

  # GET /analytics
  def index
    @analytics = Analytic.all
    @location_hash = Gmaps4rails.build_markers(@analytics.where.not(:reader_location_latitude => nil)) do |analytic, marker|
      marker.lat analytic.reader_location_latitude
      marker.lng analytic.reader_location_longitude
      marker.infowindow "<h5><a href='/analytics/#{analytic.id}'>#{analytic.page_id}</a></h5><small>#{analytic.reader_location_formatted_address}</small>"
    end
  end

  # GET /analytics/1
  def show
  end

  # GET /analytics/new
  def new
    @analytic = Analytic.new
  end

  # GET /analytics/1/edit
  def edit
  end

  # POST /analytics
  def create
    @analytic = Analytic.new(analytic_params)

    if @analytic.save
      message = 'Analytic was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @analytic, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /analytics/1
  def update
    if @analytic.update(analytic_params)
      redirect_to @analytic, notice: 'Analytic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /analytics/1
  def destroy
    @analytic.destroy
    message = "Analytic was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to analytics_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analytic
      @analytic = Analytic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def analytic_params
      params.require(:analytic).permit(:page_id, :reader_location, :view_count, :reader_id)
    end
end
