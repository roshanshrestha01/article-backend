class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_post_comment, only: [:show, :update, :destroy]
  
    # GET /posts/:post_id/comments
    def index
      json_response(@post.comment)
    end
  
    # GET /posts/:post_id/comments/:id
    def show
      json_response(@comment)
    end
  
    # POST /posts/:post_id/comments
    def create
      @post.comment.create!(comment_params)
      json_response(@post, :created)
    end
  
    # PUT /posts/:post_id/comments/:id
    def update
      @comment.update(comment_params)
      head :no_content
    end
  
    # DELETE /posts/:post_id/comments/:id
    def destroy
      @comment.destroy
      head :no_content
    end
  
    private
  
    def comment_params
      params.permit(:message, :user_id)
    end
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def set_post_comment
      @comment = @post.comments.find_by!(id: params[:id]) if @post
    end
  end