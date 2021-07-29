class AddPersonNumToReserves < ActiveRecord::Migration[6.1]
  def change
    add_column :reserves, :person_num, :integer
  end
end
