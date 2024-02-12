class Public::Trainer::HomesController < ApplicationController
    def top
        @posts = Post.order(created_at: :desc).limit(6)
    end
end
