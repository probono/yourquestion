# == Schema Info
#
# Table name: administrations
#
#  id          :integer         not null, primary key
#  description :text
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime

class Administration < ActiveRecord::Base
  
  has_many :departments, :dependent => :destroy
  has_many :questions, :dependent => :nullify

  has_friendly_id :name, :use_slug => true
  
  def average_response_time
    questions.answered.empty? ? 0 : questions.answered.sum(:days_to_answer) / questions.answered.size 
  end
  
end