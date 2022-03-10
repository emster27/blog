class Api::V1::SettingsController < Api::V1::GraphitiController
  def index
    settings = SettingResource.all(params)
    respond_with(settings)
  end

  def show
    setting = SettingResource.find(params)
    respond_with(setting)
  end

  def create
    setting = SettingResource.build(params)

    if setting.save
      render jsonapi: setting, status: 201
    else
      render jsonapi_errors: setting
    end
  end

  def update
    setting = SettingResource.find(params)

    if setting.update_attributes
      render jsonapi: setting
    else
      render jsonapi_errors: setting
    end
  end

  def destroy
    setting = SettingResource.find(params)

    if setting.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: setting
    end
  end
end
