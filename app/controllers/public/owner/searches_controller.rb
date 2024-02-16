class Public::Owner::SearchesController < ApplicationController
    
    def search_posts
        @title=params[:title]
        @records=Post.search_for(@title)
    end
end
