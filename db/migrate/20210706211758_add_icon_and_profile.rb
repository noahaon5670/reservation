class AddIconAndProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :icon, :string
    add_column :users, :profle, :text
  end
end
