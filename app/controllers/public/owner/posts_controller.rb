class Public::Owner::PostsController < ApplicationController
    
    
    def new
        @post = Post.new
    end
    
    def create
      @post = Post.new(post_params)
      @post.owner_id = current_owner.id
    
      if @post.save
        redirect_to owner_post_path(@post.id), notice: '投稿が作成されました'
      else
        render :new
      end
    end

    
    def index
    case params[:order]
    when 'newest'
      @posts = Post.includes(:advices, :owner, :category).order(created_at: :desc).paginate(page: params[:page], per_page: 8)
    when 'oldest'
      @posts = Post.includes(:advices, :owner, :category).order(created_at: :asc).paginate(page: params[:page], per_page: 8)
    when 'most_comments'
      @posts = Post.includes(:advices, :owner, :category).left_joins(:advices).group(:id).order('COUNT(advices.id) DESC').paginate(page: params[:page], per_page: 8)
    when 'most_favorites'
      @posts = Post.includes(:advices, :owner, :category)
                   .select('posts.*, COUNT(DISTINCT owner_favorites.id) + COUNT(DISTINCT trainer_favorites.id) AS total_favorites')
                   .left_joins(:owner_favorites, :trainer_favorites)
                   .group(:id)
                   .order('total_favorites DESC')
                   .paginate(page: params[:page], per_page: 8)
    else
      @posts = Post.includes(:advices, :owner, :category).order(created_at: :desc).paginate(page: params[:page], per_page: 8)
    end
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
        flash[:notice] = "投稿情報を変更しました。"
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

