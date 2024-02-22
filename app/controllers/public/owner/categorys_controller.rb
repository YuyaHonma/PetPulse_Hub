class Public::Owner::CategorysController < ApplicationController
    
  def index
    @categorys = Category.all
  end
  
  def show
    @categorys = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page], per_page: 12)
    @trainers = @category.trainers.paginate(page: params[:page], per_page: 4)
  end
end
