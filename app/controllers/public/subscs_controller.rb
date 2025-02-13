class Public::SubscsController < ApplicationController
  def index
    @subscs=Subsc.all
  end

  def show
    @subsc=Subsc.find(params[:id])
   
  end

  def create
    @subsc = Subsc.new(subsc_params)
    if @subsc.save
      redirect_to subsc_path(@subsc)
    end
  end

  def update
    @subsc=Subsc.find(params[:id])
    if @subsc.update(subsc_params)
      redirect_to admin_subsc_path(@subsc) 
    end
  end

  def destroy
    @subsc = Subsc.find(params[:id])
    @subsc.destroy
    redirect_to admin_subscs_path
  end

  private
    def subsc_params
      params.require(:subsc).permit(:subsc_image, :company_name, :name, :title, :introduction, :fee, :postage, :delivery_frequency, :minimum_period)
    end 
  end
