class UrlsController < ApplicationController
  def index
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url
    else
      render "index"
    end
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
