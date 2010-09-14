class Administration < ActiveRecord::Base
  
  has_many :departments, :dependent => :destroy
  has_many :questions, :dependent => :nullify
  
  def average_response_time
    questions.answered.empty? ? 0 : questions.answered.sum(:days_to_answer) / questions.answered.size 
  end
  
end
