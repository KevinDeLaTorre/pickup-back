require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with a title, date, and start_time" do
    event = Event.new(title: "example", date: Date.today, start_time: 1.hour.ago)
    expect(event).to be_valid
  end

  it "is not valid without a title" do
    event = Event.new(title: "", date: Date.today, start_time: 1.hour.ago)
    expect(event).to_not be_valid
  end

  it "is not valid without a date" do
    event = Event.new(title: "example", date: nil, start_time: 1.hour.ago)
    expect(event).to_not be_valid
  end
  it "is not valid without a start time" do
    event = Event.new(title: "example", date: Date.today, start_time: nil)
    expect(event).to_not be_valid
  end
end
