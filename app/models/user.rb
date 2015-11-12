class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :bookings, foreign_key: 'client_id', dependent: :destroy
  has_many :bookings, foreign_key: 'guide_id', dependent: :destroy
end
