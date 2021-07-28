class RenameReserveToReservation < ActiveRecord::Migration[6.1]
  def change
    rename_table :reservations, :reserves
  end
end
