class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_secure_password

  #validates :name, presence: true, uniqueness: true
  #validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  

  validates :name, presence: { message: "名前を入力してください" }
  validates :email, presence: { message: "メールアドレスを入力してください" }, uniqueness: { message: "メールアドレスはすでに使用されています" }
  validates :password, presence: { message: "パスワードを入力してください" }, length: { minimum: 6, message: "パスワードは6文字以上で入力してください" }, allow_nil: true, confirmation: { message: "パスワード（確認）とパスワードの入力が一致しません" }
  #validates :password_confirmation, presence: { message: "パスワード（確認）を入力してください" }, if: -> { password.present? }
end
