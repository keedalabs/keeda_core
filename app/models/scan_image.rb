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
class ScanImage < ApplicationRecord
    has_one_attached :scanned_image
    belongs_to :user
end
