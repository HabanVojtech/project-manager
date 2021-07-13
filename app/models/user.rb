class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects, -> {order("position")}, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :tags, dependent: :destroy
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :password_confirmation, presence: true
end
