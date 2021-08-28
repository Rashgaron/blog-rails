class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        @articles = Article.all
    end

    def show
        @current_user_id = current_user.id
    end

    def edit
    end

    def new
        #Creamos un nuevo articulo vacío
        #Una variable con @, es una variable que se pasa del controlador a la vista
        #Una variable sin @, es una variable que solo existe localmente
        @article = Article.new
    end

    def create
        @article = current_user.articles.create(article_params)
        redirect_to @article 
    end
    def update
        if @article.update(article_params)
            redirect_to @article
        else
            redirect_to :index
        end
    end
    def destroy
        @article.destroy
        redirect_to root_path
    end
    
    private

        def find_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.require(:article).permit(:title, :content, :status)
        end

end
