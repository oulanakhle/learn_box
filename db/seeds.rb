
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

TASKS = [
  [
    [name: "Write a book"],
    ["Plan your novel (Set an overall and daily word count goal...)",
      "Start writing (start at the beginning of a month!)",
      "Write the outline for the first act",
      "Write the outline of the first half of the second act",
      "Finish the outline of the second act",
      "Write the outline for the third act",
      "Start writing for real (adher to the goal you set yourself in the beginning)"
    ]
  ],

  [
    [name: "Learn how to draw"],
      ["Draw shapes",
        "Give value to your shapes",
        "Draw objects shaped like a sphere",
        "Draw simple three-dimensional objects like cubes",
        "More complex three-dimensional objects",
        "Draw more complex objects (e.g. a house)",
        "Draw shades and shadows",
        "Draw overlapping objects"
      ]
  ],

  [
    [name: "Solve the Rubik's Cube fast"],
      ["Familiarize with the concept of the rubics cube",
        "Look up and practice one way to solve the cube",
        "Look up and practice a different way",
        "Practice solving the cube both ways, see what works best for you",
        "Practice",
        "Practice",
        "Practice",
        "Practice"
      ]
    ]
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

  todo = Task.create!(name: "Draw portrait of myself", completed: false, hours: rand(1..3), goal: Goal.last)
  todo2 = Task.create!(name: "Draw overlapping objects", completed: false, hours: rand(1..3), goal: Goal.last)
  todo3 = Task.create!(name: "Draw shades and shadows", completed: false, hours: rand(1..3), goal: Goal.last)
  todo4 = Task.create!(name: "Draw more complex objects (e.g. a house)", completed: false, hours: rand(1..3), goal: Goal.last)
  todo5 = Task.create!(name: "More complex three-dimensional objects", completed: false, hours: rand(1..3), goal: Goal.last)
  todo6 = Task.create!(name: "Draw simple three-dimensional objects like cubes", completed: false, hours: rand(1..3), goal: Goal.last)
  todo7 = Task.create!(name: "Draw objects shaped like a sphere", completed: false, hours: rand(1..3), goal: Goal.last)
  todo8 = Task.create!(name: "Give value to your shapes", completed: false, hours: rand(1..3), goal: Goal.last)
  todo9 = Task.create!(name: "Draw shapes", completed: false, hours: rand(1..3), goal: Goal.last)
  puts "Created Task #{todo.name} for #{todo.goal.name} "

  # 3.times do
  #   link = Link.create!(url: "https://www.youtube.com/watch?v=DLzxrzFCyOs", name: "Click me", description: "Interesting video", goal: Goal.last)
  #   puts "Created link #{link.url} for #{link.goal.name} "
  # end
end

