json.movies do
    json.array!(@movies) do |movie|
        json.id movie.id
        json.title movie.title
        json.rating movie.rating
    end
end