class Public::Trainer::HomesController < ApplicationController
     
  def top
    @posts = Post.order(created_at: :desc).limit(8)
    @trainers = Trainer.limit(8) # トレーナー一覧を取得
  end
end
