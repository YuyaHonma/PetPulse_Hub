class Admin::AdvicesController < ApplicationController
  
  def destroy
    advice = Advice.find(params[:id])
    @post = advice.post
    advice.destroy
    @advices = @post.advices # 削除されたポストに関連するアドバイスを取得して@advices変数に割り当てる
    respond_to do |format|
      format.js
    end
  end
end
