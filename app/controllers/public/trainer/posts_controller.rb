class Public::Trainer::PostsController < ApplicationController
    before_action :authenticate_trainer!
   
   def index
    case params[:order]
    when 'newest'
      @posts = Post.includes(:advices, :owner, :category).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    when 'oldest'
      @posts = Post.includes(:advices, :owner, :category).order(created_at: :asc).paginate(page: params[:page], per_page: 10)
    when 'most_comments'
      @posts = Post.includes(:advices, :owner, :category).left_joins(:advices).group(:id).order('COUNT(advices.id) DESC').paginate(page: params[:page], per_page: 10)
    when 'most_favorites'
      @posts = Post.includes(:advices, :owner, :category)
                   .select('posts.*, COUNT(DISTINCT owner_favorites.id) + COUNT(DISTINCT trainer_favorites.id) AS total_favorites')
                   .left_joins(:owner_favorites, :trainer_favorites)
                   .group(:id)
                   .order('total_favorites DESC')
                   .paginate(page: params[:page], per_page: 10)
    else
      @posts = Post.includes(:advices, :owner, :category).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end
  end
   
   def show
       @posts = Post.all
       @post = Post.find(params[:id])
       @advice = Advice.new
   end
end
