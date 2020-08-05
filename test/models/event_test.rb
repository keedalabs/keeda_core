# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  address     :text
#  endtime     :datetime
#  latitude    :float
#  longitude   :float
#  starttime   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :bigint           not null
#
# Indexes
#
#  index_events_on_activity_id  (activity_id)
#
# Foreign Keys
#
#  fk_rails_...  (activity_id => activities.id)
#
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
