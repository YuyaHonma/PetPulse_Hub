class Public::Trainer::FavoritesController < ApplicationController
  before_action :authenticate_trainer!
  
  def create
    @post = Post.find(params[:post_id])
    current_trainer.trainer_favorites.create(post: @post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_trainer.trainer_favorites.find_by(post_id: @post.id)
    favorite.destroy
  end
end
