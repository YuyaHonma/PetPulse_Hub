class Public::Trainer::HomesController < ApplicationController
     
  def top
    @posts = Post.order(created_at: :desc).limit(6)
    @trainers = Trainer.limit(6) # トレーナー一覧を取得
  end
end
