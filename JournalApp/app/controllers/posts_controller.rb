class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      render :json => @post
    else
      render :json => @post.errors, :status => :unprocessable_entity
    end
  end
  
  def index
    @posts = Post.all
    render :json => @posts
  end
  
  def show
    @post = Post.find(params[:id])
    render :json => @post
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render :json => @post
  end
  

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      render :json => @post
    else
      render :json => @post.errors, :status => :unprocessable_entity
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:body, :title)
  end
end
