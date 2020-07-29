# == Schema Information
#
# Table name: scenarios
#
#  id               :bigint           not null, primary key
#  link_to_scenario :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_scenarios_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Scenario < ApplicationRecord
    has_one_attached :static_website
    belongs_to :user
end
