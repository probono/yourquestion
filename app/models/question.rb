class Question < ActiveRecord::Base
  belongs_to :administration
  belongs_to :department
  
  has_one :answer, :dependent => :destroy
  
  named_scope :sent, :conditions => ['sent_at <> ? ', nil]
  named_scope :answered, :conditions => ['answered_at <> ? ', nil]
  
  def sent?
    self.sent_at != nil
  end
  
  def sent!
    self.sent_at = Time.now
    self.save!
  end
  
  def answered!
    self.answered_at = Time.now
    self.save!
  end
  
  def answered?
    self.answered_at != nil
  end
  
end
