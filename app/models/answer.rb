# == Schema Info
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  question_id :integer
#  body        :text
#  email       :text(255)
#  name        :string(255)
#  votes_count :integer         default(0)
#  created_at  :datetime
#  updated_at  :datetime

class Answer < ActiveRecord::Base
  
  belongs_to :question
  
  has_many :votes, :dependent => :destroy
  
  def voted?(request)
    votes.find_by_vote_hash( get_hash(request) ) != nil
  end
  
  def vote!(request, request_hash, complete=true)
    vote = self.votes.find_by_request_hash(request_hash)  
    if vote
      vote.positive = complete
      vote.save!      
    else
      self.votes.create!(
        :session_id => request.session_options[:id], 
        :referer => request.referer, 
        :user_agent => request.user_agent, 
        :ip => request.remote_ip, 
        :request_hash => request_hash,
        :positive => complete)
    end  
  end  
  
  def rate
    (votes.positive.size * 100 / votes.size).to_i if voted?
  end
  
  def voted?
    !votes.empty?
  end

end