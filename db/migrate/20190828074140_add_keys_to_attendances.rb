class AddKeysToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :attendee_id, :integer, index: true
    add_column :attendances, :event_id, :integer, index: true
  end
end
