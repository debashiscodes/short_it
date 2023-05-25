class UrlsController < ApplicationController
  def index
  end

  def show
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to show_routes_path(@url.id)
    else
      render "index"
    end
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
