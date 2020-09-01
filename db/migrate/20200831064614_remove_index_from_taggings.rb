class RemoveIndexFromTaggings < ActiveRecord::Migration[6.0]
  def change
    remove_index :taggings, :tag_topic_id
    remove_index :taggings, :short_url_id
  end
end
