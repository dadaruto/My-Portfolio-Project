class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_chela!, only: [:edit, :update, :destroy]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = BlogPost.published.sorted.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = current_user.blog_posts.build(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless @blog_post.user == current_user || current_user.admin?
      redirect_to @blog_post, alert: "You are not authorized to edit this blog post."
    end
  end

  def update
    if @blog_post.user == current_user || current_user.admin?
      if @blog_post.update(blog_post_params)
        redirect_to @blog_post, notice: 'Blog post was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to @blog_post, alert: "You are not authorized to edit this blog post."
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path, notice: 'Blog post was successfully deleted.'
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :cover_image, :published_at)
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def authenticate_chela!
    unless current_user.email == "cheladorcas.ruto@gmail.com"
      redirect_to(root_path, alert: "You are not authorized to access this page.")
    end
  end
end
