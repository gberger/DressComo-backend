module Api
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
  
    # GET /api/posts
    # GET /api/posts.json
    def index
      @posts = Post.all
  
      render json: @posts
    end
  
    # GET /api/posts/1
    # GET /api/posts/1.json
    def show
      render json: @post
    end
  
    # POST /api/posts
    # POST /api/posts.json
    def create
      @post = Post.new(post_params)
      @post.author = current_user

      if @post.save
        render json: @post, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/posts/1
    # PATCH/PUT /api/posts/1.json
    def update
      @post = Post.find(params[:id])
  
      if @post.update(post_params)
        head :no_content
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/posts/1
    # DELETE /api/posts/1.json
    def destroy
      @post.destroy
  
      head :no_content
    end
  
    private
  
      def set_post
        @post = Post.find(params[:id])
      end
  
      def post_params
        puts params
        params.require(:post).permit(:text, :anonymous, :cloudinary_image_id)
      end
  end
end