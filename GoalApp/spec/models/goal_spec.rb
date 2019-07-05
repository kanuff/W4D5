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

require 'rails_helper'

RSpec.describe Goal, type: :model do 
  it { should validate_presence_of :body }
  it { should validate_presence_of :user_id }
  it { should validate_inclusion_of(:private).in_array([true, false]) }
  it { should validate_inclusion_of(:closed).in_array([true, false]) } 

  it { should belong_to(:user)}
  it { should have_many(:comments)}
  it { should have_many(:cheers)}

end
