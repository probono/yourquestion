# == Schema Info
#
# Table name: administrations
#
#  id          :integer         not null, primary key
#  description :text
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime

require 'test_helper'

class AdministrationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end