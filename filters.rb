# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end 
  nil
end
  
def experienced?(candidate)
candidate[:years_of_experience] > 2
end
  
  def qualified_candidates(candidates)
      qualified = []
      current_date = Date.today

      candidates.each do |candidate| 
      git_points = candidate[:git_points]
      language_list = candidate[:languages]
      app_date = Date.parse(candidate[:date_applied])
      age = candidate[:age]

      is_experienced = experienced?(candidate)
      has_git_points = git_points > 100
      knows_languages = language_list.any? { |language| language == 'Ruby' || language == 'Python' }
      applied_recently = (current_date - app_date).to_i < 15
      is_old_enough = age >= 18

      if is_experienced && has_git_points && knows_languages && applied_recently && is_old_enough
        qualified.push(candidate) 
      end
    end
    qualified
  end
  
  # More methods will go below
def ordered_by_qualifications(candidates)
  candidates.sort_by{|candidate| [candidate[:years_of_experience], candidate[:github_points]]}.reverse
end
