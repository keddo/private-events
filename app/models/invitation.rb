class Invitation < ApplicationRecord
    validates_uniqueness_of   :attended_event_id, scope: :attendee_id
    belongs_to :attendee, class_name: "User"
    belongs_to :attended_event, class_name: "Event"
end
