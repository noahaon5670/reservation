class RenameProfleColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :profle, :profile
  end
end
