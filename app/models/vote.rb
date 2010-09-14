class Vote < ActiveRecord::Base
  belongs_to :answer, :counter_cache => true
  
  named_scope :positive, :conditions => {:positive => true}
  named_scope :negative, :conditions => {:positive => false}
end
