class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :shortened_url,
    class_name: 'ShortenedUrl',
    primary_key: 'id',
    foreign_key: 'short_url_id'

  def self.record_visit!(user, short_url)
    Visit.create!(user_id: user.id, short_url_id: short_url.id)
  end
end
