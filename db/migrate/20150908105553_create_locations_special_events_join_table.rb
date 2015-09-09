class CreateLocationsSpecialEventsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :locations, :special_events do |t|
      # t.index [:location_id, :special_event_id]
      # t.index [:special_event_id, :location_id]
    end
  end
end
