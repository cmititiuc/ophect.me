json.array!(@meals) do |meal|
  json.extract! meal, :id, :period, :description
  json.url meal_url(meal, format: :json)
end
