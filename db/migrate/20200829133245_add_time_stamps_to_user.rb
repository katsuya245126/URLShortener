class AddTimeStampsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :created_at, :datetime, null: false
  end
end
