class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id, null: false, index: { unique: true }
      t.string :long_url, null: false
      t.string :short_url, null: false
    end
  end
end
