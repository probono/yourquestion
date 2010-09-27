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

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end