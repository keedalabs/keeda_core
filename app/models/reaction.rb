# == Schema Information
#
# Table name: reactions
#
#  id          :bigint           not null, primary key
#  object      :json
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_reactions_on_activity_id  (activity_id)
#  index_reactions_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (activity_id => activities.id)
#  fk_rails_...  (user_id => users.id)
#
class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :activity
end
