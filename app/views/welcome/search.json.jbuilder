json.movies do
    json.array!(@movies) do |movie|
      json.title movie.title
      json.rating movie.rating
    end
end