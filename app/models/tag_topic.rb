class TagTopic < ApplicationRecord
  validates :topic, presence: true

  has_many :taggings,
    class_name: 'Tagging',
    primary_key: 'id',
    foreign_key: 'tag_topic_id'

  has_many :shortened_urls, through: :taggings, source: :shortened_url

  def popular_links
    shortened_urls
      .joins(:visits)
      .group(:short_url, :long_url)
      .select('long_url, short_url, COUNT(visits.id) AS num_of_visits')
      .limit(5)
  end
end
