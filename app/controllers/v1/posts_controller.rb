class V1::PostsController < ApplicationController
    skip_before_action :authorize_request, only: [:index, :show]
    before_action :set_post, only: [:show, :update, :destroy]

    #GET /v1/posts/
    def index
        @posts = Post.paginate(:page => params[:page], :per_page => 30)
        json = {
            current_page: @posts.current_page,
            total_page: @posts.total_pages,
            has_previous_page: @posts.previous_page.present?,
            has_next_page: @posts.next_page.present?,
            results: @posts
        }
        json_response(json)
    end

    #POST /v1/posts/
    def create
        @posts = Post.new(post_params)
        @posts.user_id = current_user.id
        @posts.save
        json_response(@post, :created)
    end

    #GET /v1/posts/:id
    def show
        json_response(@post)
    end

    #PUT /v1/posts/:id
    def update
        @post.update(post_params)
        head :no_content
    end

    # DELETE /posts/:id
    def destroy
        @post.destroy
        head :no_content
    end
    
    private

    def post_params
        params.permit(:title, :source, :link)
    end

    def set_post
        @post = Post.find_by!(slug: params[:slug])
    end
end
