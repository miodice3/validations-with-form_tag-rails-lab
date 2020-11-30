require 'pry'
class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end      
  end

  # def update
  #   @post = Post.find(params[:id])

  #   @post.update(post_params)

  #   redirect_to post_path(@post)
  # end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
