class Event < ApplicationRecord
  belongs_to :creator, class_name: "User",
                       foreign_key: "user_id"
  has_and_belongs_to_many :attendees, class_name: "User", 
                                      association_foreign_key: "user_id",
                                      join_table: "attended_events_attendees"
  scope :past, -> {where("date < ?", DateTime.now)}
  scope :upcoming, -> {where("date > ?", DateTime.now)}
end
