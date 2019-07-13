class V1::PostsController < ApplicationController
    def index
        @posts = Post.all
        render json: @posts, status: :ok
    end

    def create
        @posts = Post.new(post_params)

        @posts.save
        render json: @post, status: :created
    end

    # def update
    #     @posts = Post.find(params[:id])
    # end

    def destroy
        @posts = Post.where(id: params[:id]).first
        if @posts.destroy
            head(:ok)
        else 
            head(:unprocessable_entity )
        end
    end

    private

    def post_params
        params.permit(:title, :source, :link)
    end
end
