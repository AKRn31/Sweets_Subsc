class Admin::SubscsController < ApplicationController
  layout 'admin'
  def new
    @subsc = Subsc.new
  end

  def create
    @subsc = Subsc.new(subsc_params)
    if @subsc.save
      flash[:notice] = "投稿しました"
      redirect_to admin_subsc_path(@subsc)
 
    end
  end

  def index
    @subscs=Subsc.all
   
  end

  def show
    @subsc=Subsc.find(params[:id])
    @posts=@subsc.posts
  end

  def edit
    @subsc=Subsc.find(params[:id])
  end

  def update
    @subsc=Subsc.find(params[:id])
    if @subsc.update(subsc_params)
      flash[:notice] = "保存しました"
      redirect_to admin_subsc_path(@subsc) 
    else
      render :edit
    end
  end

  def destroy
    @subsc = Subsc.find(params[:id])
    @subsc.destroy
    redirect_to admin_subscs_path, notice: 'サブスク情報を削除しました'
  end

  private
  def subsc_params
    params.require(:subsc).permit(:subsc_image, :company_name, :name, :title, :introduction, :fee, :postage, :delivery_frequency, :minimum_period)
  end
end

