
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

CATEGORIES = [
              ["others"], ["arts"], ["health"], ["fitness"], ["money"], ["self-improvement"], ["intimacy"], ["social"], ["work"], ["study"]
            ]

GOALS = [
    ["Write a book", "Arts", "hard"],
    ["Learn Javascript", "Work", "hard"],
    ["Learn how to draw", "Arts", "medium"],
    ["Solve the Rubik's Cube fast", "Self-Improvement", "hard"],
    ["Landing a standing backflip", "Fitness", "hard"],
    ["Learn a new language", "Study", "medium"],
    ["Do 40 pull-ups", "Do 100 pushups", "Fitness", "medium"],
    ["Run a marathon", "Fitness", "hard"],
    ["Build a self-driving car", "Others", "hard"],
    ["Wake-up at 4am", "Self-Improvement", "medium"],
    ["Develop a Morning Routine", "Self-Improvement", "easy"],
    ["Give up on Sugar", "Health", "easy"],
    ["Read 30 books", "Self-Improvement", "easy"],
    ["Read 1 hour daily", "Self-Improvement", "easy"],
    ["Stop using curse words", "Self-Improvement", "easy"],
    ["Walk 10.000 steps daily", "Fitness", "medium"],
    ["Work out daily", "Fitness", "medium"],
    ["Practice 0 inbox", "Self-Improvement", "easy"],
    ["Keep a diary daily", "Self-Improvement", "medium"],
    ["Give a compliment daily", "Social", "easy"],
    ["Speak to someone new daily", "Social", "easy"],
    ["Give up alcohol", "Health", "medium"],
    ["Stop watching TV", "Others", "medium"],
    ["Do a 20 minute meditation", "Self-Improvement", "easy"],
    ["Don't lie", "Self-Improvement", "medium"],
    ["Stop watching the news", "Social", "easy"],
    ["Cook something new daily", "Health", "medium"],
    ["Go for a 15 minute run", "Fitness", "easy"],
    ["Do 50 situps daily", "Fitness", "easy"],
    ["Learn a dance routine", "Study", "easy"],
    ["Dance Salsa", "Social", "medium"],
    ["Practice Jiu-Jitsu", "Fitness", "medium"],
    ["Cycle to work", "Fitness", "easy"],
    ["Knit a Scarf", "Others", "medium"],
    ["Contribute to Wikipedia", "Work", "easy"],
    ["Become a magician", "Study", "medium"],
    ["Watch a film daily", "Others", "medium"],
    ["Align your wardrobe", "Others", "medium"],
    ["Write one idea per day", "Self-Improvement", "easy"],
    ["Text one forgotten friend", "Social", "easy"],
    ["Go on a date daily", "Intimacy", "hard"],
    ["Give up social media", "Self-Improvement", "medium"],
    ["Try being a vegetarian", "Health", "medium"],
    ["Try being a vegan", "Health", "medium"],
    ["Give up your phone", "Self-Improvement", "medium"],
    ["Draw a comic book", "Arts", "medium"],
    ["Do one sudoku daily", "Others", "easy"],
    ["Learn how to code in Python", "Study", "medium"],
    ["Become proficient in Photoshop", "Study", "medium"],
    ["Dance daily", "Others", "easy"],
    ["Become a youtuber", "Social", "medium"],
    ["Quit masturbation", "Intimacy", "hard"],
    ["Learn how to play the Violin", "Study", "medium"],
    ["Learn how to surf", "Fitness", "medium"],
    ["Learn how to snowboard", "Fitness", "medium"],
    ["Learn how to skateboard", "Fitness", "medium"],
    ["Learn how to play poker", "Money", "easy"],
    ["Learn standup comedy", "Work", "medium"],
    ["Learn how to juggle a ball", "Others", "easy"],
    ["Do a triathlon", "Fitness", "hard"],
    ["Learn Chinese", "Study", "hard"],
    ["Learn how to Climb", "Fitness", "medium"]
]

oula = User.create!(name: "oula", email: "oulanakhle@gmail.com", password: "123456")
5.times do
  a = User.create!(email: Faker::Internet.email, password: "123456")
  puts "Created #{a.email}"
  #name?? --> TODO: add later
end

faper = User.create!(name: "faper", email: "addicted@porn.com", password: "123456")
ab = User.create!(name: "anon", email: "a@b.com", password: "123456")

puts "Creating Subjects"
CATEGORIES.each do |element|
  name = element[0]
  b = Subject.create(name: name)
  puts "Created Category #{b.name}"
end

puts "Creating goals"
GOALS.each do |goal|
  if !Subject.find_by_name(goal[1]).nil?
    subject = Subject.find_by_name(goal[1])
  else
    subject = Subject.find_by_name("others")
  end
  c = Goal.create!(name: goal[0], description: "", difficulty: goal[2], subject: subject, user: User.last,  progress: rand(0..50), votes: rand(0..200))
  puts "The goal is #{c.name}, with #{c.difficulty} and belonging to category #{c.subject.name} "
  puts

  30.times do
    todo = Task.create!(name: "Do not FAP. Do NOT open Pornhub.", completed: false, hours: rand(1..3), goal: Goal.last)
    puts "Created Task #{todo.name} for #{todo.goal.name} "
  end

  3.times do
    link = Link.create!(url: "https://www.youtube.com/watch?v=DLzxrzFCyOs", name: "Click me", description: "Interesting video", goal: Goal.last)
    puts "Created link #{link.url} for #{link.goal.name} "
  end
end
