class Event < ApplicationRecord
    validates :eventdate, presence: true
    validates :eventdescription, presence: true, length: { in: 20..200 }
    validates :eventname, presence: true
    validates :eventlocation, presence: true
    validates :creator_id, presence: true

    
    has_many :invitations, foreign_key: :attended_event_id
    has_many :attendees, through: :invitations, source: :attendee
    belongs_to :creator, class_name: "User"

end
