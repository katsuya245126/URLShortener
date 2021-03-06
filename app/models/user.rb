class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    class_name: 'ShortenedUrl',
    primary_key: 'id',
    foreign_key: 'user_id'

  has_many :visits

  has_many :visited_urls, -> { distinct }, through: :visits, source: :shortened_url
end
