class RemoveIndexFromVisitsColumns < ActiveRecord::Migration[6.0]
  def change
    remove_index :visits, :user_id
    remove_index :visits, :short_url_id
  end
end
