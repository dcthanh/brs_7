25.times do |n|
  title = Faker::Name.title;
  name  = Faker::Name.name;
  desc = Faker::Lorem.paragraphs(1);
  author = Faker::App.author;
  image = "default.jpeg"
  link = Faker::Lorem.sentences(1, true);
  Book.create!(title:title, name:name, desc:desc, author:author, length:100,
               image:image, number_or_view:100, link:link);
end

11.times do |n|  
  name = Faker::Name.title
  Category.create!(name:name);
end

