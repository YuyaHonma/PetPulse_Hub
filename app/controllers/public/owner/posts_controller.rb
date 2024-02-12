class Public::Owner::PostsController < ApplicationController
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.owner_id = current_owner.id
        if @post.save!
          redirect_to owner_post_path(@post.id), notice: '投稿が作成されました'
        else
          render :new
        end
    end
    
    def index
        @posts = Post.page(params[:page]).per(10)
    end
    
    def show
        @posts = Post.all
        @post = Post.find(params[:id])
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)

        redirect_to owner_post_path(@post.id)
        else
        redirect_to edit_owner_post_path(@post.id)
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to owner_posts_path, notice: '投稿が削除されました'
    end

    
    private

    def post_params
      params.require(:post).permit(:title, :category_id, :introduction, :current_approach, :image)
    end
end

