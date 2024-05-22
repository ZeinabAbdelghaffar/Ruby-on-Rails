class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "Zeinab", password: "123123123", only: :destroy

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to root_path, notice: 'Article was successfully deleted.'
    else
      redirect_to root_path, alert: 'Failed to delete the article.'
    end
  end  

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :image)
  end
end
