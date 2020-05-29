class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :postal_code, :prefecture, :city, :block ,presence: true
  has_one :address, dependent: :destroy
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday ,presence: true
  mailRegex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
　email = "a@a.com"
　email.match? mailRegex
end
