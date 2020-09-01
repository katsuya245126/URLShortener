class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false, index: { unique: true }
      t.integer :short_url_id, null: false, index: {unique: true }
    end
  end
end
