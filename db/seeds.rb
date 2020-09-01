# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(email: 'aaa@gmail.com', premium: true)
user2 = User.create!(email: 'bbb@gmail.com')
user3 = User.create!(email: 'ccc@gmail.com')

url1 = ShortenedUrl.create_shortened_url(user1, '11111111111111')
url2 = ShortenedUrl.create_shortened_url(user1, '22222222222222')
url3 = ShortenedUrl.create_shortened_url(user1, '33333333333333')
url4 = ShortenedUrl.create_shortened_url(user2, '44444444444444')
url5 = ShortenedUrl.create_shortened_url(user2, '55555555555555')
url6 = ShortenedUrl.create_shortened_url(user2, '66666666666666')
url7 = ShortenedUrl.create_shortened_url(user3, '77777777777777')
url8 = ShortenedUrl.create_shortened_url(user3, '88888888888888')
url9 = ShortenedUrl.create_shortened_url(user3, '99999999999999')

Visit.record_visit!(user1, url4)
Visit.record_visit!(user1, url5)
Visit.record_visit!(user1, url6)
Visit.record_visit!(user2, url7)
Visit.record_visit!(user2, url8)
Visit.record_visit!(user2, url9)
Visit.record_visit!(user3, url1)
Visit.record_visit!(user3, url2)
Visit.record_visit!(user3, url3)

tag1 = TagTopic.create!(topic: 'sports')
tag2 = TagTopic.create!(topic: 'news')
tag3 = TagTopic.create!(topic: 'science')

Tagging.create!(tag_topic_id: tag1.id, short_url_id: url1.id)
Tagging.create!(tag_topic_id: tag1.id, short_url_id: url4.id)
Tagging.create!(tag_topic_id: tag1.id, short_url_id: url7.id)
Tagging.create!(tag_topic_id: tag2.id, short_url_id: url2.id)
Tagging.create!(tag_topic_id: tag2.id, short_url_id: url5.id)
Tagging.create!(tag_topic_id: tag2.id, short_url_id: url8.id)
Tagging.create!(tag_topic_id: tag3.id, short_url_id: url3.id)
Tagging.create!(tag_topic_id: tag3.id, short_url_id: url6.id)
Tagging.create!(tag_topic_id: tag3.id, short_url_id: url9.id)

spammer = User.create!(email: 'spam@spammer.com')

ShortenedUrl.create_shortened_url(spammer, 'lorem ipsum')
ShortenedUrl.create_shortened_url(spammer, 'notaspam.com')
ShortenedUrl.create_shortened_url(spammer, 'sdjsldfjlskdfjl')
ShortenedUrl.create_shortened_url(spammer, 'aaaaaaaaaaaadfdfdfd')
ShortenedUrl.create_shortened_url(spammer, 'downloadfreeram.com')
