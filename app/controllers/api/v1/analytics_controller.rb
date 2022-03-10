class Api::V1::AnalyticsController < Api::V1::GraphitiController
  def index
    analytics = AnalyticResource.all(params)
    respond_with(analytics)
  end

  def show
    analytic = AnalyticResource.find(params)
    respond_with(analytic)
  end

  def create
    analytic = AnalyticResource.build(params)

    if analytic.save
      render jsonapi: analytic, status: :created
    else
      render jsonapi_errors: analytic
    end
  end

  def update
    analytic = AnalyticResource.find(params)

    if analytic.update_attributes
      render jsonapi: analytic
    else
      render jsonapi_errors: analytic
    end
  end

  def destroy
    analytic = AnalyticResource.find(params)

    if analytic.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: analytic
    end
  end
end
