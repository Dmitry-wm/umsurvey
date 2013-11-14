class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :surveys, class_name: "UserSurvey"
  belongs_to :supervisor, class_name: "AdminUser", foreign_key: :supervisor_id

  attr_accessible :first_name, :last_name, :password, :password_confirmation, :email, :remember_me, :supervisor_id

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true, presence: true, on: :create
  validates :password, confirmation: true, on: :update, if: ->(user){ user.password.present? }

  def available_surveys
    Survey.joins{ result_surveys.outer }.where{ (result_surveys.user_id.eq(my{ id }) & (result_surveys.created_at.lteq(7.days.ago))) | result_surveys.id.eq(nil) }.uniq
  end

  def full_name
    [first_name, last_name].join(" ")
  end

end
