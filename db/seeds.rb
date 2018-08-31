
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
gaming = Subject.new(name: "Gaming",subject_difficulty: 10,review_frequency: 3, subject_progress: 0, private: false, rating: 0)
gaming.user = ab
gaming.save

photography = Subject.new(name: "Photography",subject_difficulty: 7, review_frequency: 3, subject_progress: 0, private: false, rating: 0)
photography.user = ab
photography.save

minecraft = Subject.new(name: "Minecraft",subject_difficulty: 1, review_frequency: 3, subject_progress: 0, private: false, rating: 0)
minecraft.user = ab
minecraft.save

puts "Creating goals"

dota2 = Goal.new(name: "Hero selection", description: "Hero selection is crucial to learning dota 2", difficulty: 10,subject_id: 0)
dota2subject = gaming
dota2.save

insta = Goal.new(name: "Master analog focus", description: "In order to make the best use of the increased resolution, effective and rapid autofocus (AF) must accompany the increase in pixels.", difficulty: 10,subject_id: 0)
insta.subject = photography
insta.save

leika = Goal.new(name: "Get over 1000 instagram followers", description: "Post booty on mondays, food on thursdays, mikonos on fridays", difficulty: 6,subject_id: 1)
leika.subject = photography
leika.save

miner = Goal.new(name: "Create a replica of hogwarts", description: "learn how to mine and protect the home, run a dedicated server", difficulty: 1, subject_id: 1)
miner.subject = minecraft
miner.save

puts "Creating Tasks"


early_selection = Task.new({name: "Early game heroes", completed: false, hours: 1, goal_id: 0, deadline: DateTime.new(2018,9,1)})
early_selection.goal = dota2
early_selection.save


mid_selection = Task.new({name: "Mid game heroes", completed: false, hours: 3, goal_id: 0, deadline: DateTime.new(2018,9,4)})
mid_selection.goal = dota2
mid_selection.save

late_selection = Task.new({name: "Late game heroes", completed: false, hours: 2, goal_id: 0, deadline: DateTime.new(2018,9,7)})
late_selection.goal = dota2
late_selection.save

counter_picks = Task.new({name: "Counter picks", completed: false, hours: 5, goal_id: 0, deadline: DateTime.new(2018,9,14)})
counter_picks.goal = dota2
counter_picks.save

cptns_mode = Task.new({name: "Captains mode", completed: false, hours: 12, goal_id: 0, deadline: DateTime.new(2018,9,21)})
cptns_mode.goal = dota2
cptns_mode.save

#a = Task.new({name: "Find good instagram models", due_date: "april 1 2019", completed: false, hours: 50, goal_id: 0, deadline: DateTime.new(2018,9,15)})
#a.goal = insta
#a.save

#b = Task.new({name: "Outdoor first album", due_date: "april 1 2018", completed: false, hours: 10, goal_id: 1, deadline: DateTime.new(2018,9,7)})
#b = leika
#b.save

#c = Task.new({name: "indoor first album", due_date: "april 1 2020", completed: false, hours: 5, goal_id: 2, deadline: DateTime.new(2018,9,30)})
#c.goal = miner
#c.save

puts "Creating Links"
url_1 = Link.new(url: "https://www.youtube.com/watch?v=cTqCkds2Yg0&feature=youtu.be")
url_1.goal = dota2
url_1.save

url_2 = Link.new(url: "https://www.youtube.com/watch?v=q4W_4upRV04&feature=youtu.be")
url_2.goal = dota2
url_2.save

url_3 = Link.new(url: "https://www.youtube.com/watch?v=MRhvg2hvGhU")
url_3.goal = dota2
url_3.save
