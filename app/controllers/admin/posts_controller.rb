class Admin::PostsController < Admin::AdminController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.post_date = Time.now
    if @post.save
      redirect_to [:admin, @post]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.post_date = Time.now
    if @post.update(post_params)
      redirect_to [:admin, @post]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, status: :see_other
  end

  def myposts
    @myposts = Post.where(user_id: current_user)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

end
