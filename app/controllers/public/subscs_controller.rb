class Public::SubscsController < ApplicationController
  def index
    @subscs=Subsc.all
  end

  def show
    @subsc=Subsc.find(params[:id])
  end
end
