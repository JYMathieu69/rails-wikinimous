class ArticlesController < ApplicationController
  before_action :set_articles, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    set_articles
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    redirect_to article_path(@article)
  end

  def edit
    set_articles
  end

  def update
    set_articles
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    set_articles
    @article.destroy
    redirect_to articles_path
  end

  def checked!
    @checked = true
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_articles
    @article = Article.find(params[:id])
  end
end
