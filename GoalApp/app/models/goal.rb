# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  private    :boolean          default(FALSE)
#  closed     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord

  validates :body, :user_id, presence: true
  validates :private, inclusion: { in: [true, false]}
  validates :closed, inclusion: { in: [true, false]}

  has_many :cheers

  has_many :comments

  belongs_to :user
end
