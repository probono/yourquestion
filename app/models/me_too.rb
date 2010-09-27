# == Schema Info
#
# Table name: me_toos
#
#  id           :integer         not null, primary key
#  question_id  :integer
#  session_id   :string(255)
#  ip           :string(255)
#  referer      :string(255)
#  request_hash :string(255)
#  user_agent   :string(255)
#  created_at   :datetime
#  updated_at   :datetime

class MeToo < ActiveRecord::Base
  belongs_to :question, :counter_cache => true
end