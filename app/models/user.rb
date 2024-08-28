class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :plans
  has_many :polls, dependent: :destroy
  has_many :invited_plans, through: :polls, source: :plan
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  validates :username, presence: true, uniqueness: true

end
