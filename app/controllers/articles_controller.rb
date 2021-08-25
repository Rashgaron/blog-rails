class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
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
        @article = Article.create(title: params[:article][:title], status: params[:article][:status], content: params[:article][:content])
        redirect_to root_path
    end
    def update
        @article.update(title: params[:article][:title], content: params[:article][:content], status: params[:article][:status])
        render json: @article
        redirect_to @article
    end
    def destroy
        @article.destroy
        redirect_to root_path
    end
    
    def find_article
        @article = Article.find(params[:id])
    end

end
