class Admin::PostsController < ApplicationController
    
    def index
        @posts = Post.page(params[:page]).per(10)
    end
    
    def show
        @posts = Post.all
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
        flash[:notice] = "投稿の登録情報を変更しました。"
        redirect_to admin_post_path(@post.id)
        else
        redirect_to edit_admin_post_path(@post.id)
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to admin_posts_path, notice: '投稿が削除されました！'
    end
end
