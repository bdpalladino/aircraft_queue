json.array!(@flight_queues) do |flight_queue|
  json.extract! flight_queue, :id, :enqueued, :aircraft_id
  json.url flight_queue_url(flight_queue, format: :json)
end
