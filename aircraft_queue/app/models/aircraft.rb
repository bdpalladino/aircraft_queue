# Aircraft model class includes 3 string attributes:
# :flight_num
# :flight_type
# :flight_size
class Aircraft < ActiveRecord::Base
  validates :flight_num, presence: true
  validates :flight_type, presence: true
  validates :flight_size, presence: true
  belongs_to :flight_queue
end
