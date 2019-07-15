class V1::LikesController < ApplicationController
    before_action :set_post
    before_action :set_like, only: [:destroy]

    
    def create
        if already_liked?
            head(:unauthorized)
        else
            @post.like.create(user_id: current_user.id)
            json_response(@post, :created)
        end
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
