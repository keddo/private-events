class Invitation < ApplicationRecord
    belongs_to :attendee, class_name: "User"
    belongs_to :attendee_event, class_name: "Event"
end
