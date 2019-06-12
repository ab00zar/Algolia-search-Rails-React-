# README

This goal of this project is implementing Algolia search using Rails and React.

## Database

MongoDB is used for this project. As the input were a json file including a list of movies, `mongoimport` is used to import the data into the database. In addition, `objectID` field is used as the unique id of the movies (documents in the MongoDB). Here are the commands:


`mongoimport -d algolia -c temp --file Projects/movies.json --jsonArray`

`db.temp.find().forEach(function (document) { document._id = document.objectID;     db.movies.insert(document) })`

`db.movies.update({}, {$unset: {objectID: ""}})`

## Backend

The backend part is developed as an API having these endpoints:

1) To index all movies: `GET` /movies

2) To show a specific movie: `GET` /movies/:id

3) To create a new movie: `POST` /movies

4) To delete a specific movie: `DELETE` /movies/:id

## RSpec Tests

Some RSpec tests are added in the spec folder to test the API (TDD & non-TDD ways)

## Frontend

The fronted is a SPA which enables us to search among the movies by their title and also remove any of them if desired.

