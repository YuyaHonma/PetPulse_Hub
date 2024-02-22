class Admin::PostsController < ApplicationController
    
    def index
        @posts = Post.page(params[:page]).per(10)
    end
    
    def show
      @post = Post.find(params[:id])
      @advices = @post.advices
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
    
    def destroy_trainer_advice
      @advice = Advice.find(params[:id])
      @post = @advice.post
      @advice.destroy
      redirect_to admin_post_path(@post), notice: 'トレーナーのコメントが削除されました！'
    end
end
