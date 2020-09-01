class RemoveIndexFromVisits < ActiveRecord::Migration[6.0]
  def change
    remove_index :visits, [:user_id, :short_url_id]
  end
end
