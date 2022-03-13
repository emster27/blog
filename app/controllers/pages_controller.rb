class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]

  def index
    @q = Page.ransack(params[:q])
    @pages = @q.result(distinct: true).includes(:bookmarks, :comments,
                                                :profile).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    @bookmark = Bookmark.new
  end

  def new
    @page = Page.new
  end

  def edit; end

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

  def update
    if @page.update(page_params)
      redirect_to @page, notice: "Page was successfully updated."
    else
      render :edit
    end
  end

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

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:hero_image, :writer_id, :page_name)
  end
end
