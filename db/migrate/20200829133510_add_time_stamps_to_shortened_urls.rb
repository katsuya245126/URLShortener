class AddTimeStampsToShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :shortened_urls, :created_at, :datetime, null: false
  end
end
