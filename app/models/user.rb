class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_secure_password

  #validates :name, presence: true, uniqueness: true
  #validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6}, confirmation: true
  #validates :password_confirmation, presence: { message: "パスワード（確認）を入力してください" }, if: -> { password.present? }
end
