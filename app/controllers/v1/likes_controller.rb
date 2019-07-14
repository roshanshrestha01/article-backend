class V1::LikesController < ApplicationController
    skip_before_action :authorize_request, only: [:create]
    before_action :set_post
    before_action :set_like, only: [:destroy]

    
    def create
        if already_liked?
            render json: {message: 'Already liked'}, status: :unauthorized
        else
            @post.like.create(user_id: 138)
        end
        json_response(@post, :created)
    end

    def destroy
        @like.destroy
        head :no_content
      end

    private

    def already_liked?
        @post = Post.find_by!(slug: params[:post_slug])
        Like.where(
            user_id: current_user.id, 
            post_id:@post.id).exists?
      end

    def set_post
        @post = Post.find_by!(slug: params[:post_slug])
    end

    def set_like
        @like = @post.like.find(params[:id])
     end
end
