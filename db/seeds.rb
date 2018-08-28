
#needs to be done in this order since booking holds foreign keys
puts "Destroy Users"
User.destroy_all

puts "Destroy subjects"
Subject.destroy_all

puts "Destroy goals"
Goal.destroy_all

puts "Destroy tasks"
Task.destroy_all
oula = User.create(email: "oulanakhle@gmail.com", password: "123456")
ram = User.create(email: "ramnakhle@gmail.com", password: "123456")



puts "Creating subjects"
photography = Subject.new(name: "Photography",subject_difficulty: 7, review_frequency: 3, subject_progress: 0, private: false, rating: 0)
photography.user = oula
photography.save
puts " creating goals"
outdoor_expert = Goal.new(name: "Outdoor Expert", goal_difficulty: 10, completed: false,subject_id: 0)
outdoor_expert.subject = photography
outdoor_expert.save

puts "creating Task"
outdoor_first_album = Task.new({name: "Outdoor first album", due_date: "april 1 2019", completed: false, goal_id: 0})
outdoor_first_album.goal = outdoor_expert
outdoor_first_album.save

puts "creating Link"
youtube_url = Link.new(url: "https://www.youtube.com/watch?v=w3DKdiBkRDM")
youtube_url.goal = outdoor_expert
youtube_url.save





# puts "Creating Goals"
# demo_goals = [{name: "Outdoor Expert", goal_difficulty: 10, completed: false,subject_id: 0}, {goal: "Indoor Expert", goal_difficulty: 9, completed: true,subject_id: 0, links: ["https://www.youtube.com/watch?v=w3DKdiBkRDM","https://www.youtube.com/watch?v=V9w5E9I5bW4", "https://www.youtube.com/watch?v=0uhG0HvjXGw"]}, {goal: "Fish Lens Expert", goal_difficulty: 10, completed: false,subject_id: 0, links: ["https://www.youtube.com/watch?v=w3DKdiBkRDM","https://www.youtube.com/watch?v=V9w5E9I5bW4", "https://www.youtube.com/watch?v=0uhG0HvjXGw"]} ]

# puts "Creating Tasks"
# demo_tasks = [{name: "Outdoor first album", due_date: "april 1 2019", completed: false, goal_id: 0},{name: "Outdoor second", dute_date: "april 1 2019", completed: false, goal_id: 0}, {name: "Outdoor third album", dute_date: "april 1 2019", completed: false, goal_id: 0}]
# puts "Creating links"
# demo_link = {goal_id: 0, url: "https://www.youtube.com/watch?v=w3DKdiBkRDM"}

# ENTREPRENEURS = [
#   ["Jeff Bezos", "https://static3.businessinsider.de/image/59f3391fe92e2c39555cb9ac-1210/drew%20angerer-getty%20images.jpg"],
#   ["Sara Blakely", "http://i2.wp.com/dumbquestions.co/wp-content/uploads/2016/09/sarablakely.jpg?resize=600%2C600"],
#   ["Mark Zuckerberg","https://static5.businessinsider.de/image/5acd21327708e95a20082890-2000/ap18100709027901.jpg"],
#   ["Sheryl Sandberg","https://static01.nyt.com/images/2012/02/05/business/05-SANDBERG/05-SANDBERG-jumbo.jpg"],
#   ["Larry Ellison","http://www.oracle.com/us/assets/c82-larry-keyntue-img01-2321492.jpg"],
#   ["Larry Page","http://www.completenewsng.com/wp-content/uploads/2015/08/larry-page1.jpg"],
#   ["Sergey Brin","http://ipress.ua/media/gallery/full/g/e/geekhousecomua.jpg"],
#   ["Arianna Huffington","https://www.yogajournal.com/.image/t_share/MTQ2MTgwNzk5NzIwODU5MDY5/arianna-huffington.jpg"],
#   ["Ma Yun","https://timedotcom.files.wordpress.com/2014/09/jack-ma-alibaba-life-lessons-clinton-global-initiative.jpg"],
#   ["Dustin Moskovitz","http://www.siliconbeat.com/wp-content/uploads/2016/09/dustinmoskovitz-bang.jpg"],
#   ["Sergey Brin",""],
#   ["Jan Koum","http://static1.uk.businessinsider.com/image/5ae872ed42e1cc6fd90e63d0-480/jan-koum-brian-acton.jpg"],
#   ["Oprah Winfrey","https://media.licdn.com/dms/image/C5603AQFIGlMnMVBkMA/profile-displayphoto-shrink_200_200/0?e=1539820800&v=beta&t=r9EQAxzx9RZnJ9XRQKW0t8xvDQ0v04h9OY7EGv5oasE"],
#   ["Travis Kalanick","https://specials-images.forbesimg.com/imageserve/59d657a9a7ea436b47b37bfc/416x416.jpg?background=000000&cropX1=1277&cropX2=3651&cropY1=1191&cropY2=3565"],
#   ["Gabe Newell","https://specials-images.forbesimg.com/imageserve/9efa03c25417e97cae2969a1a4c60335/416x416.jpg?background=000000&cropX1=6&cropX2=663&cropY1=189&cropY2=846"],
#   ["Cher Wangg","https://i.blogs.es/8cb6d9/cher-wang/450_1000.jpg"],
#   ["Hillary Clinton", "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTE4MDAzNDEwMDU4NTc3NDIy/hillary-clinton-9251306-2-402.jpg"]
# ]



# 5.times do
#   e = User.create(email: Faker::Internet.email, password: "123456")
#   puts "Created #{e.email}"
#   #name?? --> TODO: add later
# end

# a = User.create(email: "a@b.com", password: "123456")
# puts "Created #{a.email}"

# puts "Creating Dinners"

# url = "https://gist.githubusercontent.com/b1nary/ea8fff806095bcedacce/raw/6e6de20d7514b93dd69b149289264997b49459dd/enterpreneur-quotes.json"
# motto = JSON.parse(open(url).read)

# url2 = "https://listsdesign.herokuapp.com/lists/address-es_ES.json"
# address = JSON.parse(open(url2).read)

# (0..16).to_a.each_with_index do |element, index|
#   title = ENTREPRENEURS[index][0]
#   image = ENTREPRENEURS[index][1]
#   topic = motto[element]["text"]
#   location = address["Addresses (Spain)"][element]["data"]
#   type = Faker::Coffee.blend_name
#   i = Dinner.create(title: title, location: location, price: rand(10..250), meal_type: type, capacity: rand(1..15), topic: topic, user: User.last, image: image)
#   puts "Hosting a dinner with #{i.title} about #{i.topic} in #{i.location} with #{i.image}"
# end

# #one dinner
# # i = Dinner.create(title: "ecommerce", location: "gracia", price: rand(10..10000), meal_type: "italian", capacity: rand(1..15), topic: "woah topic", user: User.last)
