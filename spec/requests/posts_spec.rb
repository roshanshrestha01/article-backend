require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
    # initialize test data 
    let(:user) { create(:user) }
    let!(:post) { create_list(:post, 10) }
    let(:post_id) { post.first.slug }
    let(:user_id) { post.first.user_id }
    let(:headers) { valid_headers }

    # Test suite for GET /todos
    describe 'GET /v1/posts/' do
      # make HTTP get request before each example
      before { get '/v1/posts/' }
  
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /v1/posts/:id' do
      before { get "/v1/posts/#{post_id}" }
  
      context 'when the record exists' do
        it 'returns the post' do
          expect(json).not_to be_empty
          expect(json['slug']).to eq(post_id)
        end
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
  
      context 'when the record does not exist' do
        let(:post_id) { 100 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
  
        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Post/)
        end
      end
    end
end