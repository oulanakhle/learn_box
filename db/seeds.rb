
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


