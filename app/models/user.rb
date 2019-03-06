class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch
  multisearchable against: [ :name]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :services, foreign_key: 'barber_id'
  has_many :appointments
  has_many :messages
  has_many :reviews
end
