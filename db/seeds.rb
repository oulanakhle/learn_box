#needs to be done in this order since booking holds foreign keys
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

oula = User.create(email: "oulanakhle@gmail.com", password: "123456")
ram = User.create(email: "ramnakhle@gmail.com", password: "123456")

puts "Creating Subjects"
photography = Subject.new(name: "Photography",subject_difficulty: 7, review_frequency: 3, subject_progress: 0, private: false, rating: 0)
photography.user = oula
photography.save

minecraft = Subject.new(name: "minecraft",subject_difficulty: 1, review_frequency: 3, subject_progress: 0, private: false, rating: 0)
minecraft.user = ram
minecraft.save

puts "Creating goals"
outdoor_expert = Goal.new(name: "Outdoor Expert", goal_difficulty: 10, completed: false,subject_id: 0)
outdoor_expert.subject = photography
outdoor_expert.save

outdoor_expert = Goal.new(name: "Outdoor Expert", goal_difficulty: 10, completed: false,subject_id: 1)
outdoor_expert.subject = photography
outdoor_expert.save

indoor_expert = Goal.new(name: "indoor Expert", goal_difficulty: 10, completed: false,subject_id: 1)
indoor_expert.subject = photography
indoor_expert.save

puts "Creating Tasks"
outdoor_first_album = Task.new({name: "Outdoor first album", due_date: "april 1 2019", completed: false, goal_id: 0})
outdoor_first_album.goal = outdoor_expert
outdoor_first_album.save

outdoor_first_album = Task.new({name: "Outdoor first album", due_date: "april 1 2018", completed: false, goal_id: 1})
outdoor_first_album.goal = outdoor_expert
outdoor_first_album.save

indoor_first_album = Task.new({name: "indoor first album", due_date: "april 1 2020", completed: false, goal_id: 2})
indoor_first_album.goal = indoor_expert
indoor_first_album.save

puts "Creating Links"
youtube_url = Link.new(url: "https://www.youtube.com/watch?v=w3DKdiBkRDM")
youtube_url.goal = outdoor_expert
youtube_url.save

youtube_url_outdoor = Link.new(url: "https://www.youtube.com/watch?v=w3DKdiBkRDM")
youtube_url_outdoor.goal = outdoor_expert
youtube_url_outdoor.save

youtube_url_indoor = Link.new(url: "https://www.youtube.com/watch?v=MRhvg2hvGhU")
youtube_url_indoor.goal = outdoor_expert
youtube_url_indoor.save
