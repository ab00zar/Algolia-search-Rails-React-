json.movies do
    json.array!(@movies) do |movie|
        json.id movie.id
        json.title movie.title
        json.rating movie.rating
        json.year movie.year
        json.image movie.image
        json.genre movie.genre
    end
end