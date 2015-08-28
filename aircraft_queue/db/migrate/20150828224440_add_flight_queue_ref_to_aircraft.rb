class AddFlightQueueRefToAircraft < ActiveRecord::Migration
  def change
    add_reference :aircrafts, :flight_queue, index: true
    add_foreign_key :aircrafts, :flight_queues
  end
end
