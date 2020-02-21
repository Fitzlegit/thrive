class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = current_user.memberships[0].posts.build
  end

  def create
    @post = current_user.memberships[0].posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'The post was created!'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "You've updated your post!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Your post was deleted'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :content, :membership_id)
  end
end
