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
    ["Learn how to draw", "Arts", "medium"],
    ["Solve the Rubik's Cube fast", "Self-Improvement", "hard"],
    ["Landing a standing backflip", "Fitness", "hard"],
    ["Learn a new language", "Study", "medium"],
    ["Run a marathon", "Fitness", "hard"],
    ["Build a self-driving car", "Others", "hard"],
    ["Work out daily", "Fitness", "medium"],
    ["Practice 0 inbox", "Self-Improvement", "easy"],
    ["Stop watching TV", "Others", "medium"],
    ["Do a 20 minute meditation", "Self-Improvement", "easy"],
    ["Don't lie", "Self-Improvement", "medium"],
    ["Do 50 situps daily", "Fitness", "easy"],
    ["Learn a dance routine", "Study", "easy"],
    ["Contribute to Wikipedia", "Work", "easy"],
    ["Learn magic", "Study", "medium"],
    ["Become a vegetarian", "Health", "medium"],
    ["Try being a vegan", "Health", "medium"],
    ["Draw a comic book", "Arts", "medium"],
    ["Become proficient in Photoshop", "Study", "medium"],
    ["Become a youtuber", "Social", "medium"],
    ["Do a triathlon", "Fitness", "hard"],
    ["Learn Chinese", "Study", "hard"],
    ["Learn how to climb", "Fitness", "hard"]
]

jan = User.create!(name: "jan", email: "jan@gmail.com", password: "123456")
oula = User.create!(name: "oula", email: "oulanakhle@gmail.com", password: "123456")
niko = User.create!(name: "niko", email: "niko@gmail.com", password: "123456")
admin = User.create!(name: "anon", email: "a@b.com", password: "123456")

puts "Creating Subjects"
CATEGORIES.each do |element|
  name = element[0]
  b = Subject.create(name: name)
  puts "Created Category #{b.name}"
end

goal_array = []
task_array = []

puts "Creating goals"

goal_array << Goal.create!(name: "Learning Chinease", description: "", difficulty: "hard", subject: Subject.find_by_name("arts"), user: User.last,  progress: rand(0..50), votes: rand(0..200))
puts "The goal is #{Goal.last.name}, with #{Goal.last.difficulty} and belonging to category #{Goal.last.subject.name} "
puts

task_array << Task.create!(name: "Learn how to draw", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Draw overlapping objects", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Draw shades and shadows", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Draw more complex objects (e.g. a house)", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "More complex three-dimensional objects", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Draw simple three-dimensional objects like cubes", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Draw objects shaped like a sphere", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Give value to your shapes", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Draw shapes", completed: false, hours: rand(1..3), goal: Goal.last)
puts "Created Task #{Task.last.name}"

goal_array << Goal.create!(name: "Write a book", description: "", difficulty: "medium", subject: Subject.find_by_name("arts"), user: User.last,  progress: rand(0..50), votes: rand(0..200))
puts "The goal is #{Goal.last.name}, with #{Goal.last.difficulty} and belonging to category #{Goal.last.subject.name} "
puts

task_array << Task.create!(name: "Plan your novel (Set an overall and daily word count goal...)", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Start writing (start at the beginning of a month!)", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Write the outline for the first act", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Write the outline of the first half of the second act", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Finish the outline of the second act", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Write the outline for the third act", completed: false, hours: rand(1..3), goal: Goal.last)
task_array << Task.create!(name: "Start writing for real (adher to the goal you set yourself in the beginning)", completed: false, hours: rand(1..3), goal: Goal.last)
dropbox = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Books", description: "Hacking learning", goal: Goal.last)
drive = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Course Notes", description: "Cool notes", goal: Goal.last)
youtube = Link.create!(url: "https://www.youtube.com/watch?v=UNP03fDSj1U", name: "Learn Faster", description: "Interesting video", goal: Goal.last)

goal_array << Goal.create!(name: "Solve the Rubik's Cube fast", description: "", difficulty: "hard", subject: Subject.find_by_name("self-improvement"), user: User.last,  progress: rand(0..50), votes: rand(0..200))
puts "The goal is #{Goal.last.name}, with #{Goal.last.difficulty} and belonging to category #{Goal.last.subject.name} "
puts

todo = Task.create(name: "Familiarize with the concept of the rubic's cube", completed: false, hours: rand(1..3), goal: Goal.last)
todo2 = Task.create(name: "Look up and practice one way to solve the cube", completed: false, hours: rand(1..3), goal: Goal.last)
todo3 = Task.create(name: "Look up and practice a different way", completed: false, hours: rand(1..3), goal: Goal.last)
todo4 = Task.create!(name: "Practice solving the cube both ways, see what works best for you", completed: false, hours: rand(1..3), goal: Goal.last)
todo5 = Task.create!(name: "Practice", completed: false, hours: rand(1..3), goal: Goal.last)
todo6 = Task.create!(name: "Practice", completed: false, hours: rand(1..3), goal: Goal.last)
todo7 = Task.create!(name: "Practice", completed: false, hours: rand(1..3), goal: Goal.last)
dropbox = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Books", description: "Hacking learning", goal: Goal.last)
drive = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Course Notes", description: "Cool notes", goal: Goal.last)
youtube = Link.create!(url: "https://www.youtube.com/watch?v=UNP03fDSj1U", name: "Learn Faster", description: "Interesting video", goal: Goal.last)

goal_array << Goal.create!(name: "Landing a standing backflip", description: "", difficulty: "medium", subject: Subject.find_by_name("fitness"), user: User.last,  progress: rand(0..50), votes: rand(0..200))
puts "The goal is #{Goal.last.name}, with #{Goal.last.difficulty} and belonging to category #{Goal.last.subject.name} "
puts

todo = Task.create(name: "Get a trampoline", completed: false, hours: rand(1..3), goal: Goal.last)
todo2 = Task.create(name: "Jump high enough to try it", completed: false, hours: rand(1..3), goal: Goal.last)
todo3 = Task.create(name: "Land a front flip on the trampoline", completed: false, hours: rand(1..3), goal: Goal.last)
todo4 = Task.create!(name: "Practice the front flip on the trampoline", completed: false, hours: rand(1..3), goal: Goal.last)
todo5 = Task.create!(name: "Land a backflip on the trampoline", completed: false, hours: rand(1..3), goal: Goal.last)
todo6 = Task.create!(name: "Practice the back flip on the trampoline", completed: false, hours: rand(1..3), goal: Goal.last)
todo7 = Task.create!(name: "Land a backflip into a swimming pool", completed: false, hours: rand(1..3), goal: Goal.last)
dropbox = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Books", description: "Hacking learning", goal: Goal.last)
drive = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Course Notes", description: "Cool notes", goal: Goal.last)
youtube = Link.create!(url: "https://www.youtube.com/watch?v=UNP03fDSj1U", name: "Learn Faster", description: "Interesting video", goal: Goal.last)

goal_array << Goal.create!(name: "Learning a new language", description: "", difficulty: "medium", subject: Subject.find_by_name("study"), user: User.last,  progress: rand(0..50), votes: rand(0..200))
puts "The goal is #{Goal.last.name}, with #{Goal.last.difficulty} and belonging to category #{Goal.last.subject.name} "
puts

todo = Task.create(name: "Memorize and practice some useful phrases", completed: false, hours: rand(1..3), goal: Goal.last)
todo2 = Task.create(name: "Learn regular present tense conjugation", completed: false, hours: rand(1..3), goal: Goal.last)
todo3 = Task.create(name: "Learn regular nouns", completed: false, hours: rand(1..3), goal: Goal.last)
todo4 = Task.create!(name: "Learn irregular present tense conjugations", completed: false, hours: rand(1..3), goal: Goal.last)
todo5 = Task.create!(name: "Learn regular past tense conjugation", completed: false, hours: rand(1..3), goal: Goal.last)
todo6 = Task.create!(name: "Learn irregular past tense conjugation", completed: false, hours: rand(1..3), goal: Goal.last)
todo7 = Task.create!(name: "Learn regular adjectives", completed: false, hours: rand(1..3), goal: Goal.last)
dropbox = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Books", description: "Hacking learning", goal: Goal.last)
drive = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Course Notes", description: "Cool notes", goal: Goal.last)
youtube = Link.create!(url: "https://www.youtube.com/watch?v=UNP03fDSj1U", name: "Learn Faster", description: "Interesting video", goal: Goal.last)

goal_array << Goal.create!(name: "Running a marathon", description: "", difficulty: "hard", subject: Subject.find_by_name("fitness"), user: User.last,  progress: rand(0..50), votes: rand(0..200))
puts "The goal is #{Goal.last.name}, with #{Goal.last.difficulty} and belonging to category #{Goal.last.subject.name} "
puts

todo = Task.create(name: "Analyze overall fitness status", completed: false, hours: rand(1..3), goal: Goal.last)
todo2 = Task.create(name: "Figure out why you actually want to do it under a month", completed: false, hours: rand(1..3), goal: Goal.last)
todo3 = Task.create(name: "Run between 10-15 km 4 days a week", completed: false, hours: rand(1..3), goal: Goal.last)
todo4 = Task.create!(name: "Long distance running on sundays", completed: false, hours: rand(1..3), goal: Goal.last)
todo5 = Task.create!(name: "Alternate rest days with swimming or cycling", completed: false, hours: rand(1..3), goal: Goal.last)
todo6 = Task.create!(name: "Do a gel bath after every run and use a foam to massage your legs", completed: false, hours: rand(1..3), goal: Goal.last)
todo7 = Task.create!(name: "Set a crazy soundtrack and.... RUN!!!", completed: false, hours: rand(1..3), goal: Goal.last)
dropbox = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Books", description: "Hacking learning", goal: Goal.last)
drive = Link.create!(url: "https://ocw.mit.edu/courses/nuclear-engineering/22-15-essential-numerical-methods-fall-2014/lecture-notes/", name: "Course Notes", description: "Cool notes", goal: Goal.last)
youtube = Link.create!(url: "https://www.youtube.com/watch?v=UNP03fDSj1U", name: "Learn Faster", description: "Interesting video", goal: Goal.last)

goal_array << Goal.create!(name: "Build a self-driving car", description: "", difficulty: "hard", subject: Subject.find_by_name("study"), user: User.last,  progress: rand(0..50), votes: rand(0..200))
puts "The goal is #{Goal.last.name}, with #{Goal.last.difficulty} and belonging to category #{Goal.last.subject.name} "
puts

goal_array << Goal.create!(name: "Practicing 0 inbox", description: "", difficulty: "easy", subject: Subject.find_by_name("self-improvement"), user: User.last,  progress: rand(0..50), votes: rand(0..200))
puts "The goal is #{Goal.last.name}, with #{Goal.last.difficulty} and belonging to category #{Goal.last.subject.name} "
puts

GOALS = [
    ["Work out daily", "Fitness", "medium"],
    ["Stop watching TV", "Others", "medium"],
    ["Doing a 20 minute meditation", "Self-Improvement", "easy"],
    ["Doing 50 situps daily", "Fitness", "easy"],
    ["Learn a dance routine", "Study", "easy"],
    ["Contribute to Wikipedia", "Work", "easy"],
    ["Learning magic", "Study", "medium"],
    ["Become a vegetarian", "Health", "medium"],
    ["Try being a vegan", "Health", "medium"],
    ["Draw a comic book", "Arts", "medium"],
    ["Become proficient in Photoshop", "Study", "medium"],
    ["Become a youtuber", "Social", "medium"],
    ["Learn how to climb", "Fitness", "hard"]
]
