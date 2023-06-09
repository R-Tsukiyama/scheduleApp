class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "スケジュールを新規登録しました"
      redirect_to posts_path
    else
      flash.now[:failure] = "スケジュールを作成できませんでした"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "スケジュールID「#{@post.id}」の情報を更新しました"
      redirect_to :post
    else
      flash.now[:failure] ="スケジュールID「#{@post.id}」の情報を更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:failure] = "スケジュールを削除しました"
    redirect_to :posts
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :start_date,
      :end_date,
      :all_day,
      :memo
    )
  end
end
