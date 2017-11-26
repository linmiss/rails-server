class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end

  def show
    # 以@开始的变量是实例变量，它属于特定的对象。可以在类或子类的方法中引用实例变量。
    # 以@@开始的变量是类变量。在类的定义中定义类变量，可以在类的特殊方法、实例方法等处对类变量进行引用／赋值
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end