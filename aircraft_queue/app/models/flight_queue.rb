# contains datetime attribute :enqueued & reference to aircraft (aircraft_id)
class FlightQueue < ActiveRecord::Base
  belongs_to :aircraft
end
