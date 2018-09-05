
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
              ["others"], ["arts"], ["health"], ["fitness"], ["money"], ["self-improvement"], ["intimacy"], ["Social"], ["Work"], ["Study"]
            ]

GOALS = [
    ["Write a book", "Arts", "9"],
    ["Learning Frontend Development", "Work", "7"],
    ["Drawing a realistic Self Portrait", "Arts", "4"],
    ["Solving the Rubik's Cube in under 60s", "Self-Improvement", "10"],
    ["Landing a standing backflip", "Fitness", "8"],
    ["Have a 30 minute conversation in a new language", "Study", "6"],
    ["Do 40 pull-ups", "Do 100 pushups", "Fitness", "4"],
    ["Run a marathon", "Fitness", "10"],
    ["Build a self-driving car", "Others", "10"],
    ["Wake-up every day at 4am", "Self-Improvement", "6"],
    ["Develop a Daily Morning Routine", "Self-Improvement", "1"],
    ["Give up on Sugar", "Health", "3"],
    ["Read 30 books", "Self-Improvement", "2"],
    ["Read 1 hour every day", "Self-Improvement", "2"],
    ["Stop using curse words", "Self-Improvement", "3"],
    ["Walk 10.000 steps a day", "Fitness", "5"],
    ["Work out every day", "Fitness", "5"],
    ["Practice 0 inbox", "Self-Improvement", "2"],
    ["Keep a diary every day", "Self-Improvement", "5"],
    ["Take a photo every day on your way to work", "Others", "1"],
    ["Give a compliment a day", "Social", "3"],
    ["Speak to someone new every day", "Social", "3"],
    ["Give up alcohol", "Health", "5"],
    ["Stop watching TV", "Others", "4"],
    ["Do a 20 minute meditation", "Self-Improvement", "2"],
    ["Don't lie for a day", "Self-Improvement", "7"],
    ["Change the news for interesting articles", "Social", "2"],
    ["Cook something new every day", "Health", "6"],
    ["Go for a 15 minute run", "Fitness", "2"],
    ["Do 50 situps a day", "Fitness", "3"],
    ["Learn a dance routine", "Study", "3"],
    ["Dance Salsa", "Social", "4"],
    ["Sign up for and go to Jiu-Jitsu class", "Fitness", "4"],
    ["Cycle to work", "Fitness", "2"],
    ["Knit a Scarf", "Others", "5"],
    ["Contribute to Wikipedia", "Work", "3"],
    ["Become a magician", "Study", "7"],
    ["Watch a film a day", "Others", "4"],
    ["Align your wardrobe", "Others", "5"],
    ["Write one idea per day", "Self-Improvement", "3"],
    ["Text one forgotten friend", "Social", "1"],
    ["Read about a different period of history", "Study", "2"],
    ["Go on a date daily", "Intimacy", "8"],
    ["Give up social media", "Self-Improvement", "5"],
    ["Try being a vegetarian", "Health", "4"],
    ["Try being a vegan", "Health", "6"],
    ["Give up your phone", "Self-Improvement", "6"],
    ["Draw a comic book", "Arts", "4"],
    ["Do one sudoku daily", "Others", "2"],
    ["Learn how to code in Python", "Study", "7"],
    ["Become proficient in Photoshop", "Study", "5"],
    ["Dance every day", "Others", "2"],
    ["Post a daily youtube video", "Social", "7"],
    ["Throw one object away per day", "Others", "2"],
    ["Quit masturbation", "Intimacy", "9"],
    ["Learn how to play the Violin", "Study", "7"],
    ["Learn how to surf", "Fitness", "6"],
    ["Learn how to snowboard", "Fitness", "5"],
    ["Learn how to skateboard", "Fitness", "6"],
    ["Learn how to play poker", "Money", "3"],
    ["Learn standup comedy", "Work", "6"],
    ["Learn how to juggle a ball", "Others", "2"],
    ["Do a triathlon", "Fitness", "9"],
    ["Learn Chinese", "Study", "9"],
    ["Learn how to Climb", "Fitness", "4"]
]

oula = User.create!(name: "oula", email: "oulanakhle@gmail.com", password: "123456")
5.times do
  a = User.create!(email: Faker::Internet.email, password: "123456")
  puts "Created #{a.email}"
  #name?? --> TODO: add later
end

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

  5.times do
    todo = Task.create!(name: "Early game heroes", completed: false, hours: rand(1..3), goal: Goal.last)
    puts "Created Task #{todo.name} for #{todo.goal.name} "
  end

  3.times do
    link = Link.create!(url: "https://www.youtube.com/watch?v=DLzxrzFCyOs", name: "Click me", description: "Interesting video", goal: Goal.last)
    puts "Created link #{link.url} for #{link.goal.name} "
  end
end
