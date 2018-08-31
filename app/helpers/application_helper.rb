module ApplicationHelper
  def calculate_time(goal)
    time = 0
    goal.tasks.each do |task|
      time += task.hours
    end

    return time
  end

  def first_deadline(goal)
    deadline =
  end
end
