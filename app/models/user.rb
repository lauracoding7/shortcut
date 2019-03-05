class User < ApplicationRecord
   has_many :services
   has_many :appointments
   has_many :messages
   has_many :reviews
end
