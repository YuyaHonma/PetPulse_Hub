class Pet < ApplicationRecord
  has_one_attached :image
  belongs_to :owner

  validates :image, presence: true
  validates :pet_name, presence: true
  validates :pet_name_kana, presence: true
  validates :gender, presence: true
  validates :dog_breed, presence: true
  validates :dog_birthday, presence: true

  enum gender: { 男の子: 0, 女の子: 1 } # オプションは必要に応じて変更してください

  enum dog_breed: {
    ポメラニアン: 0,
    チワワ: 1,
    ダックスフント: 2,
    柴犬: 3,
    パグ: 4,
    シベリアンハスキー: 5,
    ボーダーコリー: 6,
    ゴールデンレトリバー: 7,
    ラブラドールレトリバー: 8,
    フレンチブルドッグ: 9,
    プードル: 10,
    シーズー: 11,
    ボクサー: 12,
    ロットワイラー: 13,
    シェットランドシープドッグ: 14,
    シャイニーズクレステッド: 15,
    ベンガル: 16,
    ローズイヤードクローク: 17,
    アイリッシュセッター: 18,
    ダルメシアン: 19,
    ビーグル: 20,
    ジャックラッセルテリア: 21,
    ボルゾイ: 22,
    コーギー: 23,
    マルチーズ: 24,
    ウェルシュ・コーギー: 25,
    ボストンテリア: 26,
    ブルドッグ: 27,
    ラブラドゥードル: 28,
    ブルーヒーラー: 29,
    ニューファンドランド: 30,
    シャーペイ: 31,
    ローデシアン・リッジバック: 32,
    ボネット: 33,
    ダックス: 34,
    ヨークシャーテリア: 35, # マルチーズから変更
    ゴールデンドゥードル: 36,
    グレートデン: 37,
    ミニチュア・ピンシャー: 38,
    ブリュッセル・グリフォン: 39,
    プーリー: 40,
    ボーダーコリー・スムース: 41, # ボーダーコリーから変更
    ボロニーズ: 42,
    ポーリッシュ・ロー: 43,
    ポーチュギーズ・ウォーター・ドッグ: 44,
    プーマランド: 45,
    プーメラニアン: 46,
    フォックステリア: 47,
    フランドル: 48,
    プンメリアン: 49,
    シュナイダー: 50,
  }

end
