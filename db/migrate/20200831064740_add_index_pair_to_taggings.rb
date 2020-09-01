class AddIndexPairToTaggings < ActiveRecord::Migration[6.0]
  def change
    add_index :taggings, [:tag_topic_id, :short_url_id], unique: true
  end
end
