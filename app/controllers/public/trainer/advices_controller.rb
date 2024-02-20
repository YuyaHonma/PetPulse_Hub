class Public::Trainer::AdvicesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    advice = current_trainer.advices.new(advice_params)
    advice.post_id = @post.id
    if advice.save
      flash[:success] = "アドバイスが追加されました。"
    else
      flash[:error] = "アドバイスの追加に失敗しました。"
    end
    redirect_to @post
  end

  def destroy
    advice = Advice.find(params[:id])
    @post = advice.post
    if advice.destroy
      flash[:success] = "アドバイスが削除されました。"
    else
      flash[:error] = "アドバイスの削除に失敗しました。"
    end
    redirect_to @post
  end

  private

  def advice_params
    params.require(:advice).permit(:advice)
  end
end
