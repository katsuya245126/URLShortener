class ShortenedUrl < ApplicationRecord
  validates :user_id, :long_url, :short_url, presence: true
  validates :short_url, uniqueness: true

  validate :no_spamming, :nonpremium_max

  belongs_to :submitter,
    class_name: 'User',
    primary_key: 'id',
    foreign_key: 'user_id'

  has_many :visits,
    class_name: 'Visit',
    primary_key: 'id',
    foreign_key: 'short_url_id',
    dependent: :destroy

  has_many :taggings, 
    class_name: 'Tagging',
    primary_key: 'id',
    foreign_key: 'short_url_id',
    dependent: :destroy

  has_many :visitors, -> { distinct }, through: :visits, source: :user

  has_many :tags, through: :taggings, source: :tag_topic

  def self.prune(n)
    time_ago = n.minutes.ago

    ShortenedUrl
      .joins('LEFT JOIN visits ON visits.short_url_id = shortened_urls.id')
      .joins('JOIN users ON shortened_urls.user_id = users.id')
      .where('visits.created_at < ? OR (visits.id IS NULL AND shortened_urls.created_at < ?)', time_ago, time_ago)
      .where('users.premium': false)
      .destroy_all
  end

  def self.random_code
    str = nil

    loop do
      str = SecureRandom.urlsafe_base64

      break unless ShortenedUrl.exists?(short_url: str)
    end

    str
  end

  def self.create_shortened_url(user, long_url)
    shortened_url = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: shortened_url)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visitors.where(created_at: (Time.current - 1.day)..(Time.current)).count
  end

  def no_spamming
    max_link_count = ShortenedUrl
      .where(created_at: (Time.current - 1.minute)..(Time.current))
      .where(user_id: user_id)
      .count >= 5

    errors[:maximum] << 'of 5 links per minute' if max_link_count
  end

  def nonpremium_max
    return if User.find(user_id).premium

    max_link_count = ShortenedUrl
      .where(user_id: user_id)
      .count >= 5

    errors[:Nonpremium] << 'users can only make 5 links' if max_link_count
  end
end
