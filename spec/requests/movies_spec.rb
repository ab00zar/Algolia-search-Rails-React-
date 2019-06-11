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
end 