# == Schema Info
#
# Table name: departments
#
#  id                :integer         not null, primary key
#  administration_id :integer
#  address           :text
#  description       :text
#  email             :string(255)
#  name              :string(255)
#  phone             :string(255)
#  created_at        :datetime
#  updated_at        :datetime

class Department < ActiveRecord::Base
  
  belongs_to :administration
  has_many :questions, :dependent => :nullify
  
  has_friendly_id :name, :use_slug => true
  
end