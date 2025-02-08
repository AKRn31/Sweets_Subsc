class Public::SubscsController < ApplicationController
  def index
    @subscs=Subsc.all
  end

  def show
    @subsc=Subsc.find(params[:id])
    @posts= @subsc.posts
  end

  def create
    @subsc = Subsc.new(subsc_params)
    if @subsc.save
      flash[:notice] = "投稿しました"
      redirect_to subsc_path(@subsc)
    end
  end

end
