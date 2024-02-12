class Public::Trainer::PostsController < ApplicationController
   
   def index
      @posts = Post.page(params[:page]).per(10)
   end
   
   def show
       @posts = Post.all
       @post = Post.find(params[:id])
       @advice = Advice.new
   end
end
