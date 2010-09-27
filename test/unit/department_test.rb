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

require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end