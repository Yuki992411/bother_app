# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  name       :string(255)
#  star_rate  :float(24)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
