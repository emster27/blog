class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]

  # GET /pages
  def index
    @q = Page.ransack(params[:q])
    @pages = @q.result(distinct: true).includes(:comments, :analytics,
                                                :bookmarks, :profile).page(params[:page]).per(10)
  end

  # GET /pages/1
  def show
    @bookmark = Bookmark.new
    @analytic = Analytic.new
    @comment = Comment.new
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit; end

  # POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      message = "Page was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @page, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to @page, notice: "Page was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    message = "Page was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to pages_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def page_params
    params.require(:page).permit(:hero_image, :writer_id)
  end
end
