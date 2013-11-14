class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :first_name, :last_name, :password, :password_confirmation, :email, :remember_mes
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  # attr_accessible :title, :body
end
