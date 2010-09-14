class Question < ActiveRecord::Base
  belongs_to :administration
  belongs_to :department
  
  has_one :answer, :dependent => :destroy
  
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
    self.save!
  end
  
  def answered?
    self.answered_at != nil
  end
  
  
end
