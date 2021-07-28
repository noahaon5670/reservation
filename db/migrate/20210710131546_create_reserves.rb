class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.string :room_name
      t.date :start_date
      t.date :end_date
      t.integer :fee
      t.integer :room_id
      t.integer :post_user_id
      t.integer :reserve_user_id

      t.timestamps
    end
  end
end
