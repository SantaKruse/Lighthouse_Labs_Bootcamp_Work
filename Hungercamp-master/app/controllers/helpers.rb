helpers do  # helper methods for program
  def get_user(id)
    User.find(id)
  end

  def get_assignment(id)
    Assignment.find(id)
  end

  def response_exists(user_id, assignment_id)
    found = Response.where(user_id: user_id, assignment_id: assignment_id)
    (found.nil? || found.empty?) ? false : true    
  end

  def assignment_due_date(user_id, assignment)
    current_user = get_user(user_id)
    due = current_user.start_date + assignment.due_date
  end 

  def assignment_due(user_id, assignment)
    assignment_due_date(user_id,assignment) <= Date.today + 1
  end

    def to_boolean(boolean_string)
    boolean_string.downcase == "true"
  end
end