class SettingsController < ApplicationController
  before_action :set_setting, only: %i[show edit update destroy]

  def index
    @q = Setting.ransack(params[:q])
    @settings = @q.result(distinct: true).includes(:profile).page(params[:page]).per(10)
  end

  def show; end

  def new
    @setting = Setting.new
  end

  def edit; end

  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      message = "Setting was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @setting, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @setting.update(setting_params)
      redirect_to @setting, notice: "Setting was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @setting.destroy
    message = "Setting was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to settings_url, notice: message
    end
  end

  private

  def set_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(:owner_info, :billing, :billing_card,
                                    :domains, :profile_id)
  end
end
