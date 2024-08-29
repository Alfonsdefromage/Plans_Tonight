require 'open-uri'
require 'nokogiri'
require 'faker'

Poll.destroy_all
Plan.destroy_all
Bar.destroy_all
User.destroy_all

def attach_photo(bar, photo_url, filename)
  file = URI.open(photo_url)
  bar.photo.attach(io: file, filename: filename, content_type: 'image/png')
  bar.save
end

Bar.create!(
  name: "Craft Beer Bar Monkey Wrench",
  address: "〒214-0032 神奈川県川崎市多摩区枡形3-5-4 1F",
  location: "Shinagawa",
  mood: "Casual",
  price: "$$",
  smoking: true,
  food: true,
  alcohol: "Craft Beer",
  longitude: 139.5605306023052,
  latitude: 35.61685821763033,
  url: "https://tabelog.com/kanagawa/A1405/A140506/14075022/"
).tap do |bar|
  attach_photo(bar, "https://lh3.googleusercontent.com/p/AF1QipPz8eqe8ybBtXmygxakkO-eYg3rEgA19S7Ihgqt=s1360-w1360-h1020", 'user1.png')
end

Bar.create!(
  name: "Sputnik",
  address: "2-18-6,Ebisunishi,Shibuya,Tokyo,Japan",
  location: "Shibuya",
  mood: "Casual",
  price: "$$",
  smoking: false,
  food: true,
  alcohol: "Cocktail",
  longitude: 139.7048060202411,
  latitude: 35.65142638822411,
  url: "https://www.instagram.com/hi_sputnik/"
).tap do |bar|
  attach_photo(bar, "https://lh3.googleusercontent.com/p/AF1QipPjOggnwKN0zVZIISLNx7rByM7VsCuUsPUrZbck=s1360-w1360-h1020", 'user2.png')
end

Bar.create!(
  name: "The Music Bar - Cave Shibuya",
  address: "〒150-0002 Tokyo, Shibuya City, Shibuya, 1 Chome-15-12 LAIDOUT SHIBUYA B1F",
  location: "Shibuya",
  mood: "Music",
  price: "$$",
  smoking: false,
  food: true,
  alcohol: "Anything",
  longitude: 139.70295191821114,
  latitude: 35.66100916882782,
  url: "https://the-musicbar.jp/wp/wp-content/uploads/2023/10/FOOD_MusicBar_20230929_FIX_ol.pdf"
).tap do |bar|
  attach_photo(bar, "https://lh3.googleusercontent.com/p/AF1QipOe1bx7C9PLI-0xPc4L5hjc0mNyst7bpwCEfA8N=s1360-w1360-h1020", 'user3.png')
end

Bar.create!(
  name: "DJ Bar Bridge Shibuya",
  address: "〒150-0002 東京都渋谷区渋谷１丁目２５−６ 渋谷パークサイド共同ビル10F",
  location: "Shibuya",
  mood: "Dance",
  price: "$",
  smoking: true,
  food: false,
  alcohol: "Anything",
  longitude: 139.70148363996984,
  latitude: 35.65970776640392,
  url: "https://djbar-bridge.com/"
).tap do |bar|
  attach_photo(bar, "https://lh3.googleusercontent.com/p/AF1QipPEnKA9-rtKSuidizmad6_MLKZ6t5djNm7yQcTx=s1360-w1360-h1020", 'user4.png')
end

Bar.create!(
  name: "Muscle Girls",
  address: "〒171-0014 Tokyo, Toshima City, Ikebukuro, 2 Chome-41-2, Hayama Bld, B1F",
  location: "Ikebukuro",
  mood: "Theme",
  price: "$$",
  smoking: false,
  food: true,
  alcohol: "Anything",
  longitude: 139.70974154845496,
  latitude: 35.73350037074206,
  url: "https://musclegirls.jimdofree.com/"
).tap do |bar|
  attach_photo(bar, "https://thesmartlocal.jp/wp-content/uploads/2023/03/muscle-girls-3-1024x768.jpg", 'user5.png')
end

Bar.create!(
  name: "Sky Lounge Stellar Garden",
  address: "〒105-0011 Tokyo, Minato City, Shibakoen, 4 Chome-8-1 33F",
  location: "Shibakoen",
  mood: "Luxury",
  price: "$$$",
  smoking: false,
  food: true,
  alcohol: "Cocktail",
  longitude: 39.7483423020964,
  latitude: 35.65591424418253,
  url: "https://www.princehotels.co.jp/parktower/restaurant/stellargarden/"
).tap do |bar|
  attach_photo(bar, "https://www.princehotels.com/parktower/wp-content/uploads/sites/14/2019/07/res-stellar-platinum.jpg.jpg", 'user6.png')
end

Bar.create!(
  name: "WOMB",
  address: "2-16 Maruyamacho, Shibuya City, Tokyo 150-0044",
  location: "Shibuya",
  mood: "Dance",
  price: "$$$",
  smoking: true,
  food: false,
  alcohol: "Anything",
  longitude: 139.69459813396182,
  latitude: 35.66355578251508,
  url: "https://www.womb.co.jp/reservation/"
).tap do |bar|
  attach_photo(bar, "https://media.timeout.com/images/106017162/image.jpg", 'user7.png')
end

Bar.create!(
  name: "Pintology Craft Beer & Whisky",
  address: "〒151-0073 東京都渋谷区笹塚１丁目３３−１０ 香樹ハイツ 101",
  location: "Shibuya",
  mood: "Casual",
  price: "$$",
  smoking: false,
  food: false,
  alcohol: "Craft Beer",
  longitude: 139.66581370606173,
  latitude: 35.67272189658194,
  url: "https://www.instagram.com/pintologytokyo/"
).tap do |bar|
  attach_photo(bar, "https://lh3.googleusercontent.com/p/AF1QipNtGDbqngmYCjWZjsq0UP69Q0GHKb4rgKz5F4Rp=s1360-w1360-h1020", 'user8.png')
end

Bar.create!(
  name: "Rooftop Bar Andaz Tokyo Toranomon Hills",
  address: "〒105-0001 Tokyo, Minato City, Toranomon, 1 Chome−23−4 ヒルズ 森タワ アンダーズ 東京52F 虎ノ門ヒルズ森タワー",
  location: "Toranomon",
  mood: "Luxury",
  price: "$$$",
  smoking: false,
  food: true,
  alcohol: "Cocktails",
  longitude: 139.7494569872622,
  latitude: 35.66718854657908,
  url: "https://www.andaztokyo.jp/restaurants/jp/rooftop-bar/?utm_source=gmb&utm_medium=organic#menu"
).tap do |bar|
  attach_photo(bar, "https://lh3.googleusercontent.com/p/AF1QipPEnKA9-rtKSuidizmad6_MLKZ6t5djNm7yQcTx=s1360-w1360-h1020", 'user9.png')
end

Bar.create!(
  name: "Magic Bar CUORE",
  address: "〒160-0021 Tokyo, Shinjuku City, Kabukicho, 1 Chome−2−13 新光ビル 5階",
  location: "Shinjuku",
  mood: "Theme",
  price: "$$$",
  smoking: false,
  food: false,
  alcohol: "Anything",
  longitude: 139.70459031687258,
  latitude: 35.69863637921583,
  url: "https://cuore.bar/"
).tap do |bar|
  attach_photo(bar, "https://lh3.googleusercontent.com/p/AF1QipPEnKA9-rtKSuidizmad6_MLKZ6t5djNm7yQcTx=s1360-w1360-h1020", 'user10.png')
end

Bar.create!(
  name: "Berry bar",
  address: "1 Chome-3-9 Kamimeguro, Meguro City, Tokyo 153-0051",
  location: "Meguro",
  mood: "Casual",
  price: "$",
  smoking: false,
  food: false,
  alcohol: "Anything",
  longitude: 139.70101925396588,
  latitude: 35.645056062319625,
  url: "https://www.instagram.com/berry.nakameguro/?hl=en"
).tap do |bar|
  attach_photo(bar, "https://cdn.sanity.io/images/rizm0do5/production/006d954b454f4a119053d86a88177689153ce7e8-1000x658.webp?rect=24,0,976,658&w=1380&h=930&q=80&fit=clip&auto=format", 'user11.png')
end

User.create!(
  email: "yutaasakura@gmail.com",
  username: "Yuta Asakura",
  password: '123123'
).tap do |user|
  attach_photo(user, "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBNElmQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--8b0905ab4c08e8c0479f28013bdeac4260e97ba6/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lKYW5CbFp3WTZCa1ZVT2hOeVpYTnBlbVZmZEc5ZlptbHNiRnNJYVFISWFRSElld1k2Q1dOeWIzQTZEbUYwZEdWdWRHbHZiZz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--23cdbdf9871e44adeb4d843a03b0793a5f08394b/748A3411-5577-4F30-A69D-1B8E8C179282-47382-00001A23901F415F.jpeg", 'user12.png')
end

# User.create!(
#   email: "jonasai-taher@gmail.com",
#   username: "Jonas Ai-Taher",
#   password: '123123'
# ).tap do |user|
#   attach_photo(user, "https://avatars.githubusercontent.com/u/157728594?v=4", 'user13.png')
# end

User.create!(
  email: "Alihaddi@gmail.com",
  username: "Ali Haddi",
  password: '123123'
).tap do |user|
  attach_photo(user, "https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOEVlQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--fa45c07f152e42ab8130e067208a14a447560cd0/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/1696392921765%20(1).jpg", 'user15.png')
end

# User.create!(
#   email: "miaoconnel@gmail.com",
#   username: "Mia O'Connell",
#   password: '123123'
# ).tap do |user|
#   attach_photo(user, "https://avatars.githubusercontent.com/u/117554256?v=4", 'user16.png')
# end

User.create!(
  email: "eriyawata@gmail.com",
  username: "Eri Yawata",
  password: '123123'
).tap do |user|
  attach_photo(user, "https://avatars.githubusercontent.com/u/157731956?v=4", 'user18.png')
end

User.create!(
  email: "youngkevein@gmail.com",
  username: "Kevin Young",
  password: '123123'
).tap do |user|
  attach_photo(user, "https://avatars.githubusercontent.com/u/35987034?v=4", 'user19.png')
end

User.create!(
  email: "Ryuya@gmail.com",
  username: "Ryuya Inagaki",
  password: '123123'
).tap do |user|
  attach_photo(user, "https://avatars.githubusercontent.com/u/77526127?v=4", 'user25.png')
end

# User.create!(
#   email: "ryo@gmail.com",
#   username: "Ryo Imaoka",
#   password: '123123'
# ).tap do |user|
#   attach_photo(user, "https://avatars.githubusercontent.com/u/162281080?v=4", 'user27.png')
# end

# plan = Plan.create!(
#   date_time: DateTime.now,
#   deadline: DateTime.now + 5.hours,
#   location: "Example Location 1",
#   user: User.first,
#   bar: Bar.first,
#   status: "done"
# )

# plans = Plan.create!(
#   date_time: DateTime.now,
#   deadline: DateTime.now + 5.hours,
#   location: "Example Location 2",
#   user: User.last,
#   status: "pending"
# )

# User.all.each do |user|
#   Poll.create!(
#     submitted: [true, false].sample,
#     mood: ["Casual", "Cozy", "Music", "Dance", "Luxury", "Theme"].sample,
#     price: ["$", "$$", "$$$"].sample,
#     smoking: [true, false].sample,
#     food: [true, false].sample,
#     alcohol: ["Craft Beer", "Cocktail", "Whiskey", "Anything"].sample,
#     user: user,
#     plan: [plan, plans].sample
# #   )
# end
