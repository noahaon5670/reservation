class RenameReservationToReserve < ActiveRecord::Migration[6.1]
  def change
    rename_table :reserves, :reservations
  end
end
