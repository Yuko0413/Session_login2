class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: { message: "を入力してください" }, length: { minimum: 6, message: "は6文字以上で入力してください" }, allow_nil: true, confirmation: { message: "とパスワードの入力が一致しません" }
  validates :password_confirmation, presence: { message: "を入力してください" }, if: -> { password_digest_changed? }
end

