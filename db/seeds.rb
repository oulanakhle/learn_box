
#needs to be done in this order since booking holds foreign keys
require 'open-uri'
require 'faker'
require 'pry'

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

CATEGORIES = [
              ["Others"], ["Arts"], ["Health"], ["Fitness"], ["Money"], ["Self-Improvement"], ["Intimacy"], ["Social"], ["Work"], ["Study"]
            ]

GOALS = ["Writting a book",
        "Learning Frontend Development",
        "Drawing a realistic Self Portrait",
        "Solving the Rubik's Cube in under 60s",
        "Landing a standing backflip",
        "Have a 30 minute conversation in a new language",
        "Do 40 pull-ups", "Do 100 pushups",
        "Run a marathon",
        "Build a self-driving car",
        "Wake-up every day at 4am",
        "Develop a Daily Morning Routine",
        "Give up on Sugar",
        "Read 30 books",
        "Read 1 hour every day",
        "Stop using curse words",
        "Walk 10.000 steps a day",
        "Work out every day",
        "Practice 0 inbox",
        "Keep a diary every day",
        "Take a photo every day on your way to work",
        "Give a compliment a day",
        "Speak to someone new every day",
        "Give up alcohol", "Stop watching TV",
        "Do a 20 minute meditation",
        "No lying",
        "Change the news for interesting articles",
        "Cook something new every day",
        "Go for a 15 minute run",
        "Do 50 situps a day",
        "Learn a dance routine",
        "Dance Salsa",
        "Sign up for every single Jiu-Jitsu class",
        "Cycle to work",
        "Knit a Scarf",
        "Contribute to Wikipedia",
        "Become a magician",
        "Watch a film a day",
        "Wear the same outfit every day",
        "Write one idea per day",
        "Text one forgotten friend",
        "Read about a different period of history",
        "Go on a date daily",
        "Give up social media",
        "Try being a vegetarian",
        "Try being a vegan",
        "Give up your phone",
        "Draw a comic book",
        "Do one sudoku daily",
        "Learn how to code in Python",
        "Become proficient in Photoshop",
        "Dance every day",
        "Post a daily youtube video",
        "Throw one object away per day",
        "Quit masturbation",
        "Learn how to play the Violin",
        "Learn how to surf",
        "Learn how to snowboard",
        "Learn how to skateboard",
        "Learn how to play poker",
        "Learn standup comedy",
        "Learn how to juggle a ball",
        "Do a triathlon",
        "Learn Chinease",
        "Learn how to Climb"
        ]


oula = User.create(name: "oula", email: "oulanakhle@gmail.com", password: "123456")
5.times do
  a = User.create(email: Faker::Internet.email, password: "123456")
  puts "Created #{a.email}"
  #name?? --> TODO: add later
end

ab = User.create(name: "anon", email: "a@b.com", password: "123456")

puts "Creating Subjects"
CATEGORIES.each do |element|
  name = element[0]
  b = Subject.create(name: name)
  puts "Created Category #{b.name}"
end

puts "Creating goals"
65.times do
  name = GOALS[rand(0..65)]
  c = Goal.create(name: name, description: "", difficulty: rand(1..10), subject: Subject.all[rand(0...Subject.all.length)], user: User.last,  progress: rand(0..50), votes: rand(0..200))
  puts "The goal is #{c.name}, with #{c.difficulty} and belonging to category #{c.subject.name} "
  puts

  5.times do
    todo = Task.create(name: "Early game heroes", completed: false, hours: rand(1..3), goal: Goal.last)
    puts "Created Task #{todo.name} for #{todo.goal.name} "
  end

  3.times do
    link = Link.create(url: "https://www.youtube.com/watch?v=DLzxrzFCyOs", name: "Click me", description: "Interesting video", goal: Goal.last)
    puts "Created link #{link.url} for #{link.goal.name} "
  end
end
