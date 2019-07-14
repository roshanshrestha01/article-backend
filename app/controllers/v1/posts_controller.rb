class V1::PostsController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]

    #GET /v1/posts/
    def index
        @posts = Post.all
        json_response(@posts)
    end

    #POST /v1/posts/
    def create
        @posts = Post.new(post_params)

        @posts.save
        json_response(@post, :created)
    end

    #GET /v1/posts/:id
    def show
        json_response(@todo)
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
        @post = Post.find(params[:id])
    end
end
