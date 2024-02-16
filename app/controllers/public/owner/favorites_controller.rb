class Public::Owner::FavoritesController < ApplicationController
    
    
    
    def create
        @post = Post.find(params[:post_id])
        favorite = current_owner.owner_favorites.new(post_id: @post.id)
        favorite.save
    end
  
    def destroy
        @post = Post.find(params[:post_id])
        favorite = current_owner.owner_favorites.find_by(post_id: @post.id)
        favorite.destroy
    end
end