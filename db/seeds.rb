
#needs to be done in this order since booking holds foreign keys
require 'open-uri'
require 'faker'

puts "Destrying Links"
Link.destroy_all

puts "Destroying Tasks"
Task.destroy_all

puts "Destroying Goals"
Goal.destroy_all

puts "Destroying Subjects"
Subject.destroy_all

puts "Destroying Users"
User.destroy_all

ab = User.create(email: "a@b.com", password: "123456")
oula = User.create(email: "oulanakhle@gmail.com", password: "123456")
5.times do
  e = User.create(email: Faker::Internet.email, password: "123456")
  puts "Created #{e.email}"
  #name?? --> TODO: add later
end

puts "Creating Subjects"
photography = Subject.new(name: "Photography",subject_difficulty: 7, review_frequency: 3, subject_progress: 0, private: false, rating: 0)
photography.user = oula
photography.save

minecraft = Subject.new(name: "Minecraft",subject_difficulty: 1, review_frequency: 3, subject_progress: 0, private: false, rating: 0)
minecraft.user = ab
minecraft.save

puts "Creating goals"
insta = Goal.new(name: "Get instagram famous", description: "gotta do lots of hard work over here", difficulty: 10,subject_id: 0)
insta.subject = photography
insta.save

leika = Goal.new(name: "Master a leika", description: "gotta do lots of hard work over here", difficulty: 6,subject_id: 1)
leika.subject = photography
leika.save

miner = Goal.new(name: "Become a 3D artist", description: "gotta do lots of hard work over here", difficulty: 1, subject_id: 1)
miner.subject = minecraft
miner.save

puts "Creating Tasks"
a = Task.new({name: "Find good instagram models", due_date: "april 1 2019", completed: false, hours: 50, goal_id: 0, deadline: DateTime.new(2018,9,15)})
a.goal = insta
a.save

b = Task.new({name: "Outdoor first album", due_date: "april 1 2018", completed: false, hours: 10, goal_id: 1, deadline: DateTime.new(2018,9,7)})
b = leika
b.save

c = Task.new({name: "indoor first album", due_date: "april 1 2020", completed: false, hours: 5, goal_id: 2, deadline: DateTime.new(2018,9,30)})
c.goal = miner
c.save

puts "Creating Links"
url_1 = Link.new(url: "https://www.youtube.com/watch?v=w3DKdiBkRDM")
url_1.goal = insta
url_1.save

url_2 = Link.new(url: "https://www.youtube.com/watch?v=w3DKdiBkRDM")
url_2.goal = leika
url_2.save

url_3 = Link.new(url: "https://www.youtube.com/watch?v=MRhvg2hvGhU")
url_3.goal = miner
url_3.save
