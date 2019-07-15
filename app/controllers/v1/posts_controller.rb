class V1::PostsController < ApplicationController
    skip_before_action :authorize_request, only: [:index, :show]
    before_action :set_post, only: [:show, :update, :destroy]
    before_action :set_user_when_token, only: [:index]

    #GET /v1/posts/
    def index
        @posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 30)
        set_pagination_headers
        json_response(@posts)
    end

    #POST /v1/posts/
    def create
        @posts = Post.new(post_params)
        @posts.user_id = current_user.id
        @posts.save
        json_response(@post, :created)
    end

    #GET /v1/posts/:slug
    def show
        json_response(@post)
    end

    #PUT /v1/posts/:slug
    def update
        @post.update(post_params)
        head :no_content
    end

    # DELETE /posts/:slug
    def destroy
        @post.destroy
        head :no_content
    end
    
    private

    def set_pagination_headers
        headers["X-Total-Pages"] = @posts.total_pages
        headers["Link"] = {"next_page": @posts.next_page, "previous_page": @posts.previous_page}.to_json if @posts.next_page
    end

    def post_params
        params.permit(:title, :source, :link)
    end

    def set_post
        @post = Post.find_by!(slug: params[:slug])
    end
end
