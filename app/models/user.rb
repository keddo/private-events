class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :name, length: { in: 5..25 }
    validates :username, length: { in: 5..15 }
    validates :email,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
              message: "Email invalid"  },
              uniqueness: { case_sensitive: false },
              length: { minimum: 4, maximum: 254 }

    has_many :invitations, foreign_key: :attendee_id
    has_many :attended_events, through: :invitations
    has_many :events, foreign_key: :creator_id
end