class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :school
  has_many :surveys, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges, dependent: :destroy
  has_one_attached :photo
  has_one :referral, dependent: :destroy

  def survey_name
    "#{last_name}, #{first_name}"
  end
end
