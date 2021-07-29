class RemoveRoomNameToReservation < ActiveRecord::Migration[6.1]
  def change
    remove_column :reserves, :room_name, :string
  end
end
