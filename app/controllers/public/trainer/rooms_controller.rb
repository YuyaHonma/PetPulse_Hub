class Public::Trainer::RoomsController < ApplicationController
  before_action :authenticate_trainer! # トレーナーがログインしていることを確認する
  before_action :set_room, only: [:show]

  def show
    @message = Message.new # 新しいメッセージ用のインスタンスを作成します
    @messages = @room.messages # ルームに関連するすべてのメッセージを取得します
  end

  def create
    # ルームの作成ロジックをここに追加します
  end

  private

  def set_room
    @room = Room.find(params[:id]) # パラメータからルームを検索してセットします
  end
end