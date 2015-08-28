json.array!(@aircrafts) do |aircraft|
  json.extract! aircraft, :id, :flight_num, :type, :size
  json.url aircraft_url(aircraft, format: :json)
end
