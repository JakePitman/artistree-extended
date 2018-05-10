class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :styles, through: :profile
  has_many :prof_pictures, through: :profile
  has_many :incoming_requests, class_name: 'Request', foreign_key: 'artist_id'
  has_many :outgoing_requests, class_name: 'Request', foreign_key: 'buyer_id'
  has_many :messages
end
