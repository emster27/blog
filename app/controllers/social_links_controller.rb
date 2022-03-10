class SocialLinksController < ApplicationController
  before_action :set_social_link, only: %i[show edit update destroy]

  def index
    @q = SocialLink.ransack(params[:q])
    @social_links = @q.result(distinct: true).includes(:profile).page(params[:page]).per(10)
  end

  def show; end

  def new
    @social_link = SocialLink.new
  end

  def edit; end

  def create
    @social_link = SocialLink.new(social_link_params)

    if @social_link.save
      message = "SocialLink was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @social_link, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @social_link.update(social_link_params)
      redirect_to @social_link, notice: "Social link was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @social_link.destroy
    message = "SocialLink was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to social_links_url, notice: message
    end
  end

  private

  def set_social_link
    @social_link = SocialLink.find(params[:id])
  end

  def social_link_params
    params.require(:social_link).permit(:username, :medium, :password,
                                        :profile_id)
  end
end
