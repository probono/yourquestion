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

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end