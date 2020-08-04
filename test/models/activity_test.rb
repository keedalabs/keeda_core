# == Schema Information
#
# Table name: activities
#
#  id                 :bigint           not null, primary key
#  content            :text
#  heading            :text
#  object             :json
#  sort_order         :integer
#  verb               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  parent_activity_id :integer
#  parent_id          :integer
#  user_id            :bigint           not null
#
# Indexes
#
#  index_activities_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
