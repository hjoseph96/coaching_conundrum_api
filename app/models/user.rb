class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, [ :user, :coach ]

  has_many :open_slots

  has_many :booked_appointments, foreign_key: :booked_by_id, class_name: "Appointment"
  has_many :my_appointments, foreign_key: :coach_id, class_name: "Appointment"
end
