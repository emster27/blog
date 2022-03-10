class Api::V1::SocialLinksController < Api::V1::GraphitiController
  def index
    social_links = SocialLinkResource.all(params)
    respond_with(social_links)
  end

  def show
    social_link = SocialLinkResource.find(params)
    respond_with(social_link)
  end

  def create
    social_link = SocialLinkResource.build(params)

    if social_link.save
      render jsonapi: social_link, status: 201
    else
      render jsonapi_errors: social_link
    end
  end

  def update
    social_link = SocialLinkResource.find(params)

    if social_link.update_attributes
      render jsonapi: social_link
    else
      render jsonapi_errors: social_link
    end
  end

  def destroy
    social_link = SocialLinkResource.find(params)

    if social_link.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: social_link
    end
  end
end
