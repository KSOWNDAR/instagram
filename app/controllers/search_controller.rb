class SearchController < ApplicationController
  $word = ""
  def index
    $word = params[:query]
    if params[:query].start_with?('#')
      query = params[:query].gsub('#','')
      @posts = Post.joins(:hash_tags).where(hash_tags: {name: query})
    else
      @posts = Post.where("description like ?", "%#{params[:query]}%")
    end 
  end
  
  def displayuser 
    @accounts = Account.where("username like ?", "%#{$word}%")
  end
  def show
    @user = User.new
    @accounts = Account.where("username like ?", "%#{params[:query]}%")
  end
end
