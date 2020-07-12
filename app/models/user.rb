class User < ApplicationRecord
  has_many :events
  has_and_belongs_to_many :attended_events, class_name: "User",
                                      foreign_key: "user_id",
                                      association_foreign_key: "event_id",
                                      join_table: "attended_events_attendees"
end
