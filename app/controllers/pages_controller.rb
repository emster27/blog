class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]

  def index
    @q = Page.ransack(params[:q])
    @pages = @q.result(distinct: true).includes(:bookmarks,
                                                :comments).page(params[:page]).per(10)
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
      redirect_to @page, notice: "Page was successfully created."
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
    redirect_to pages_url, notice: "Page was successfully destroyed."
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:hero_image, :page_name, :page_content,
                                 :comment)
  end
end
