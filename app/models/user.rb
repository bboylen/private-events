class User < ApplicationRecord
  has_many :events
  has_and_belongs_to_many :attended_events, class_name: "Event",
                                      association_foreign_key: "event_id",
                                      join_table: "attended_events_attendees"
  
  def upcoming_events
    self.events.where("date > ?", DateTime.now)
  end
  
  def previous_events
    self.events.where("date < ?", DateTime.now)
  end

end
