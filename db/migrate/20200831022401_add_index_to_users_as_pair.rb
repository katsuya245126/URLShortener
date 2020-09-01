class AddIndexToUsersAsPair < ActiveRecord::Migration[6.0]
  def change
    add_index :visits, [:user_id, :short_url_id], unique: true
  end
end
