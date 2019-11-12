class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]
  # after_action :redirect, only: %i[create update destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect
  end

  def destroy
    @article.destroy
    redirect
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def redirect
    redirect_to articles_path
  end

end
