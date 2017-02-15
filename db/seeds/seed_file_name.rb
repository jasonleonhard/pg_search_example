1111.times do
  Gallery.create title: FFaker::Internet.user_name
  Article.create title: FFaker::Internet.user_name, body: FFaker::Internet.email
end
