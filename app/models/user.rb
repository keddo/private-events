class User < ApplicationRecord
    has_many :invitations, foreign_key: :attendee_id
    has_many :attended_events, through: :invitations
    has_many :events, foreign_key: :creator_id

    has_secure_password
end