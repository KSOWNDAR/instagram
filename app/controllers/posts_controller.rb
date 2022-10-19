class PostsController < ApplicationController
    before_action :authenticate_account!
    before_action :set_post, only: [:show]
    def new 
        @post = Post.new 
    end

    def create 
        @post = Post.new(post_params)
        @post.account_id = current_account.id if account_signed_in? 

        if @post.save
            redirect_to dashboard_path, flash: {notice: "Post was created successfully!" }
        else
            redirect_to new_post_path, flash: { notice: "1.Post was not saved! Please upload file in jpg/jpeg/gif format \n 2.Image size must greater than 1 MB" }
        end
    end

    def show 
        @comment = Comment.new 
        @comments = Comment.includes(:account).where(post_id: @post.id)
    end
    
    def destroy 
        @post = current_account.posts.find(params[:id])
        @post.destroy 

        redirect_to dashboard_path
    end
    private 

    def set_post 
        @post = Post.find(params[:id]) if params[:id].present?
    end
    
    def post_params
        params.require(:post).permit(:image,:description)
    end
end