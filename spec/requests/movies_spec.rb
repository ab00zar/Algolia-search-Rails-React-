require 'rails_helper'

describe 'Movies API', type: :request do
    describe 'GET /api/v1/movies' do
        before { get '/api/v1/movies' }

        it 'return movies' do
            expect(json).not_to be_empty
            expect(json.size).to eq(5892)
        end

        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'GET /api/v1/movies/:id' do

        context 'when the movie exists' do
            before { get '/api/v1/movies/439378210' }

            it 'returns the movie' do
                expect(json).not_to be_empty
                expect(json['_id']).to eq("439378210")
            end

            it 'return status code 200' do
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'POST /api/v1/movies' do
        context 'when the params are valid' do
            let(:valid_params) { {title: 'My New Movie', rating: 4} }
            before { post '/api/v1/movies', params: valid_params }

            it 'creates a movie' do
                expect(json['title']).to eq('My New Movie')
            end
        end
    end
end 