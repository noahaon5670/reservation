class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :explanation
      t.integer :fee
      t.string :addres
      t.string :room_image

      t.timestamps
    end
  end
end
