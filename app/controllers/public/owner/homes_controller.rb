class Public::Owner::HomesController < ApplicationController
    
  def top
    @posts = Post.order(created_at: :desc).limit(8) # 新着投稿一覧を取得
    @trainers = Trainer.limit(6) # トレーナー一覧を取得
    @categorys = Category.limit(6) # カテゴリー一覧を取得
  end

  def about
  end

end
