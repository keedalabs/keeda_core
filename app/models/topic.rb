# == Schema Information
#
# Table name: topics
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Topic < ApplicationRecord
  acts_as_followable
  has_many :activity_topics
  has_many :activities, through: :activity_topics
end
