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
class Activity < ApplicationRecord
  default_scope { order("created_at DESC") }
  before_destroy :destroy_activity_topics

  belongs_to :user
  has_many :activity_topics, dependent: :destroy
  has_many :topics, through: :activity_topics
  has_many :replies, :class_name => "Activity", foreign_key: 'parent_activity_id', dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_one :event
  accepts_nested_attributes_for :event
  belongs_to :parent_activity, :class_name => "Activity", foreign_key: 'parent_activity_id', optional: true
  has_rich_text :content
  has_paper_trail
  has_closure_tree order: 'sort_order', numeric_order: true
  def destroy_activity_topics
    self.activity_topics.destroy_all
  end
  def destroy_activity_replies
    self.replies.destroy_all
  end
  def topic_list
    ActivityTopic.where(activity_id:self.id).map{|object| object.topic}
  end
  def topics
    super.pluck(:name).join(',')
  end

end
