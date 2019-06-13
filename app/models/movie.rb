class Movie
  include Mongoid::Document
  include AlgoliaSearch

  algoliasearch do
    attribute :title, :alternative_titles
    searchableAttributes ['title', 'alternative_titles']
  end

  field :title, type: String
  field :alternative_titles, type: Array
  field :year, type: Integer
  field :image, type: String
  field :color, type: String
  field :score, type: Float
  field :rating, type: Integer
  field :actors, type: Array
  field :actor_facets, type: Array
  field :genre, type: Array
end
