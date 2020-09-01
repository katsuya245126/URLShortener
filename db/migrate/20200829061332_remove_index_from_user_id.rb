class RemoveIndexFromUserId < ActiveRecord::Migration[6.0]
  def change
    remove_index :shortened_urls, :user_id
  end
end
