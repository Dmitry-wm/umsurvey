class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  attr_accessible :first_name, :last_name, :password, :password_confirmation, :email, :remember_mes
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true, presence: true, on: :create
  validates :password, confirmation: true, on: :update, if: ->(user){ user.password.present? }
end
