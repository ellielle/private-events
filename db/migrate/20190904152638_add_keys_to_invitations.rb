class AddKeysToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :invited_user_id, :integer, index: true
    add_column :invitations, :invited_event_id, :integer, index: true
  end
end
