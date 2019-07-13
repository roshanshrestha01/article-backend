require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
    # initialize test data 
    let!(:post) { create_list(:post, 10) }
    let(:post_id) { post.first.id }
  
    # Test suite for GET /todos
    describe 'GET /v1/posts/' do
      # make HTTP get request before each example
      before { get '/v1/posts' }
  
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
end