# == Schema Info
#
# Table name: votes
#
#  id           :integer         not null, primary key
#  answer_id    :integer
#  session_id   :string(255)
#  ip           :string(255)
#  positive     :boolean
#  referer      :string(255)
#  request_hash :string(255)
#  user_agent   :string(255)
#  created_at   :datetime
#  updated_at   :datetime

class Vote < ActiveRecord::Base
  belongs_to :answer, :counter_cache => true
  
  named_scope :positive, :conditions => {:positive => true}
  named_scope :negative, :conditions => {:positive => false}
end