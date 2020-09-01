class AddTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.integer :short_url_id, null: false, index: { unique: false }
      t.integer :tag_topic_id, null: false, index: { unique: false }
    end
  end
end
