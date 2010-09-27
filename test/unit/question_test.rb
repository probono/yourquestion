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

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end