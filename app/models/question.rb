# == Schema Info
#
# Table name: questions
#
#  id                :integer         not null, primary key
#  administration_id :integer
#  department_id     :integer
#  body              :text
#  days_to_answer    :integer
#  email             :string(255)
#  me_toos_count     :integer         default(0)
#  name              :string(255)
#  title             :string(255)
#  answered_at       :datetime
#  created_at        :datetime
#  sent_at           :datetime
#  updated_at        :datetime

class Question < ActiveRecord::Base
  
  acts_as_taggable
  has_friendly_id :title, :use_slug => true
  
  belongs_to :administration
  belongs_to :department
  
  has_one :answer, :dependent => :destroy
  has_many :me_toos, :dependent => :destroy
  
  named_scope :pending, :conditions => ['sent_at is not ? and answered_at is ? ', nil, nil]
  named_scope :sent, :conditions => ['sent_at is not ? ', nil]
  named_scope :answered, :conditions => ['answered_at is not ? ', nil]
    
  def sent?
    self.sent_at != nil
  end
  
  def sent!(time=Time.now)
    self.sent_at = time
    self.save!
  end
  
  def answered!(time=Time.now)
    self.answered_at = time
    self.days_to_answer = (self.answered_at.to_date - self.sent_at.to_date).to_i
    self.save!
  end
  
  def answered?
    self.answered_at != nil
  end
  
  def answered_date(format=:short)
    I18n.l(answered_at, :format => format) if answered_at
  end
  def sent_date(format=:short)
    I18n.l(sent_at, :format => format) if sent_at
  end
  def creation_date(format=:short)
    I18n.l(created_at, :format => format)
  end
  
  def me_too!(request, request_hash)    
    self.me_toos.create!(
      :session_id => request.session_options[:id], 
      :referer => request.referer, 
      :user_agent => request.user_agent, 
      :ip => request.remote_ip, 
      :request_hash => request_hash
    ) unless self.me_toos.find_by_request_hash(request_hash)    
  end
  
  
end