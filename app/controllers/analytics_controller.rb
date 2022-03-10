class AnalyticsController < ApplicationController
  before_action :set_analytic, only: %i[show edit update destroy]

  def index
    @q = Analytic.ransack(params[:q])
    @analytics = @q.result(distinct: true).includes(:page,
                                                    :bookmark).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@analytics.where.not(reader_location_latitude: nil)) do |analytic, marker|
      marker.lat analytic.reader_location_latitude
      marker.lng analytic.reader_location_longitude
    end
  end

  def show; end

  def new
    @analytic = Analytic.new
  end

  def edit; end

  def create
    @analytic = Analytic.new(analytic_params)

    if @analytic.save
      message = "Analytic was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @analytic, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @analytic.update(analytic_params)
      redirect_to @analytic, notice: "Analytic was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @analytic.destroy
    message = "Analytic was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to analytics_url, notice: message
    end
  end

  private

  def set_analytic
    @analytic = Analytic.find(params[:id])
  end

  def analytic_params
    params.require(:analytic).permit(:page_id, :reader_location, :view_count,
                                     :reader_id)
  end
end
