class Admin::SubscsController < ApplicationController
  layout 'admin'
  def new
    @subsc=Subsc.new
  end

  def create
    @subsc = Subsc.new(subsc_params)
    if @subsc.save
      flash[:notice] = "投稿しました"
      redirect_to subsc_path(subsc)
    else
      render :new
    end
  end

  def index
    @subscs=Subsc.all
   
  end

  def show
    @subsc=Subsc.find(params[:id])
    @is_admin = current_user.admin?
  end

  def edit

  end

  private
  def subsc_params
    params.require(:subsc).permit(:subsc_image, :company_name, :name, :title, :introduction, :fee, :postage, :delivery_frequency, :minimum_period)
  end
end

