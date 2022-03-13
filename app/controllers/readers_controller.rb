class ReadersController < ApplicationController
  before_action :set_reader, only: %i[show edit update destroy]

  def index
    @q = Reader.ransack(params[:q])
    @readers = @q.result(distinct: true).includes(:bookmarks).page(params[:page]).per(10)
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @reader = Reader.new
  end

  def edit; end

  def create
    @reader = Reader.new(reader_params)

    if @reader.save
      redirect_to @reader, notice: "Reader was successfully created."
    else
      render :new
    end
  end

  def update
    if @reader.update(reader_params)
      redirect_to @reader, notice: "Reader was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @reader.destroy
    redirect_to readers_url, notice: "Reader was successfully destroyed."
  end

  private

  def set_reader
    @reader = Reader.find(params[:id])
  end

  def reader_params
    params.require(:reader).permit(:email, :reader_name)
  end
end
