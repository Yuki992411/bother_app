# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text(65535)      not null
#  name       :string(255)      not null
#  star       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#  user_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :board
 
  enum star: [ :'1', :'2', :'3', :'4', :'5' ]

  validates :name, presence: true, length: { maximum: 10 }
  validates :comment, presence: true, length: { maximum: 1000 }

end
