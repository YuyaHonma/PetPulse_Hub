# app/controllers/public/trainer/advices_controller.rb
class Public::Trainer::AdvicesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    advice = current_trainer.advices.new(advice_params)
    advice.post_id = post.id
    advice.save
    redirect_to request.referer
  end

  def destroy
    advice = Advice.find(params[:id])
    advice.destroy
    redirect_to request.referer
  end

  private

  def advice_params
    params.require(:advice).permit(:advice)
  end
end
