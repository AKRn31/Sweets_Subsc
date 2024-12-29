class SubscsController < ApplicationController
  def index
    @subsc=Subsc.all
  end

  def show
    @subsc=Subsc.find(params[:id])
  end
end
