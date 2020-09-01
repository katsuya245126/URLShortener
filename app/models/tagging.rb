class Tagging < ApplicationRecord
  belongs_to :tag_topic,
    class_name: "TagTopic",
    primary_key: 'id',
    foreign_key: 'tag_topic_id'

  belongs_to :shortened_url,
    class_name: 'ShortenedUrl',
    primary_key: 'id',
    foreign_key: 'short_url_id'
end
