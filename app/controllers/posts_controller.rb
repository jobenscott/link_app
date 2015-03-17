class PostsController < ApplicationController
 
  def index
    @posts = Post.all.order(vote: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def vote
    @post = Post.find(params[:id])
    @post.vote += 1
    @post.save!
    redirect_to posts_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.vote -= 1
    @post.save!
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :vote)
  end
end
