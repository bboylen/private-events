class AttendedEventsAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attended_events_attendees, id: false do |t|
      t.belongs_to :user
      t.belongs_to :event 
    end
  end
end
