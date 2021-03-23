class MainController < ApplicationController
  def index
    tmp = Xkcd.new
    @images = tmp.images
  end
end
