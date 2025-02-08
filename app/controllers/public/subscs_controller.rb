class Public::SubscsController < ApplicationController
  def index
    @subscs=Subsc.all
  end

  def show
    @subsc=Subsc.find(params[:id])
    @posts= @subsc.posts
  end
end
