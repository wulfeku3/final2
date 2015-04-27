json.array!(@fnafs) do |fnaf|
  json.extract! fnaf, :id, :name, :picture, :species, :gender, :first_game, :second_game, :third_game
  json.url fnaf_url(fnaf, format: :json)
end