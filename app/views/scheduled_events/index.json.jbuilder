json.array!(@scheduled_events) do |scheduled_event|
  json.extract! scheduled_event, :id, :day
  json.url scheduled_event_url(scheduled_event, format: :json)
end
