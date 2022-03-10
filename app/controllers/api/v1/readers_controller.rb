class Api::V1::ReadersController < Api::V1::GraphitiController
  def index
    readers = ReaderResource.all(params)
    respond_with(readers)
  end

  def show
    reader = ReaderResource.find(params)
    respond_with(reader)
  end

  def create
    reader = ReaderResource.build(params)

    if reader.save
      render jsonapi: reader, status: :created
    else
      render jsonapi_errors: reader
    end
  end

  def update
    reader = ReaderResource.find(params)

    if reader.update_attributes
      render jsonapi: reader
    else
      render jsonapi_errors: reader
    end
  end

  def destroy
    reader = ReaderResource.find(params)

    if reader.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: reader
    end
  end
end
