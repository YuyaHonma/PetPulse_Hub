class Public::Trainer::CategorysController < ApplicationController
  before_action :authenticate_trainer!
  
  def index
    @category = Category.new
    @categorys = Category.all.order(id: :desc)
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "新規カテゴリーを作成しました。"
      redirect_to trainer_categorys_path
    else
      flash.now[:alert] = "カテゴリーの作成に失敗しました。"
      render :index
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "カテゴリーを更新しました。"
      redirect_to trainer_categorys_path
    else
      flash.now[:alert] = "カテゴリーの更新に失敗しました。"
      render :edit
    end
  end
  
  private

  def category_params
    params.require(:category).permit(:name)
  end
end
