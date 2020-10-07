require 'rails_helper'
require 'capybara/rspec'
require 'spec_helper'

RSpec.describe Event, type: :model do
  context 'Association tests' do
    it { should belong_to(:creator) }
    it { should have_many(:invitations) }
    it { should have_many(:attendees) }
  end

  context 'validation tests' do
    # it 'Event creation should be valid' do
    #   expect(Event.new(eventname: 'ThisIsName', eventlocation: 'Mekelle', eventdate: '2020-10-06 17:39:19 +0300', eventdescription: 'This is event descripiton for event date hthehejhlkjljlajdfkj', creator_id: 2)).to be_valid
    # end

    it 'Shouldn´t save if the event description is less than 20 or more than 200 characters' do
      event = Event.new(eventname: 'ThisIsName', eventlocation: 'Mekelle', eventdate: '2020-10-06 17:39:19 +0300', eventdescription: 'This is event', creator_id: 2)
      expect(event.save).to eq(false)
    end

    it 'Event name should exist' do
      event = Event.new(eventname: '', eventlocation: 'Mekelle', eventdate: '2020-10-06 17:39:19 +0300', eventdescription: 'This is event descripiton for event date hthehejhlkjljlajdfkj', creator_id: 2)
      expect(event.save).to eq(false)
    end

    it 'Event location should exist' do
      event = Event.new(eventname: 'ThisIsName', eventlocation: '', eventdate: '2020-10-06 17:39:19 +0300', eventdescription: 'This is event descripiton for event date hthehejhlkjljlajdfkj', creator_id: 2)
      expect(event.save).to eq(false)
    end

    it 'Event date should exist' do
      event = Event.new(eventname: 'ThisIsName', eventlocation: '', eventdate: '', eventdescription: 'This is event descripiton for event date hthehejhlkjljlajdfkj', creator_id: 2)
      expect(event.save).to eq(false)
    end
  end
end
