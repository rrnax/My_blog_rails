class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    respond_to do |format|
      format.html do
        @post = Post.find(params[:id])
      end
      format.pdf do
        @post = Post.find(params[:id])
        render pdf: "file_name", template: "posts/show", layout: "pdf", formats: [:html]   # Excluding ".pdf" extension.

      end
    end
  end

  def new
    @post = Post.new
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

end
