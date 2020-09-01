class AddUpdatedAtColumnToUsersAndShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :updated_at, :datetime, null: false
    add_column :shortened_urls, :updated_at, :datetime, null: false
  end
end
