# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  address    :text
#  endtime    :datetime
#  latitude   :float
#  longitude  :float
#  starttime  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Event < ApplicationRecord
  geocoded_by :address
end
