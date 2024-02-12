class Public::Trainer::CategorysController < ApplicationController
    
    def index
        @category = Category.new
        @categorys = Category.all.order(id: :desc)
    end
    
    def create
        @category = Category.new(category_params)
        @category.save
        flash[:notice] = "新規作成に成功しました。"
        @categorys = Category.all
        redirect_to trainer_categorys_path
    end
    
    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category=Category.find(params[:id])
        @category.update(category_params)
        redirect_to trainer_categorys_path
    end
    
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to trainer_categorys_path, notice: "カテゴリーを削除しました。"
    end
    
    private

    def category_params
      params.require(:category).permit(:name)
    end
end
