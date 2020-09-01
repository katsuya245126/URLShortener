class CreateTagTopicsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_topics do |t|
      t.integer :short_url_id, null: false, index: { unique: false }
      t.string :topic, null: false
    end
  end
end
