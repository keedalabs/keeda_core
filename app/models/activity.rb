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
  include AlgoliaSearch
  reverse_geocoded_by :event_longitude, :event_latitude
  algoliasearch do
    attributes :heading, :content, :verb, :created_at, :event_starttime, :event_endtime, :event_latitude, :event_longitude, :event_address
    geoloc :event_latitude, :event_longitude
  end
  def event_starttime
    event&.starttime
  end
  def event_endtime
    event&.endtime
  end
  def event_latitude
    event&.latitude
  end
  def event_longitude
    event&.longitude
  end
  def event_address
    event&.address
  end
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
