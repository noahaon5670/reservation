class RenameAddresToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :addres, :address
  end
end
