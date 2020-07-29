# == Schema Information
#
# Table name: scan_images
#
#  id         :bigint           not null, primary key
#  label      :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_scan_images_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class ScanImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
