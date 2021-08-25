class ArticlesController < ApplicationController

    def index
       @articles = Article.all 
    end

    def new
        #Creamos un nuevo articulo vacío
        #Una variable con @, es una variable que se pasa del controlador a la vista
        #Una variable sin @, es una variable que solo existe localmente
        @article = Article.new
        @article.title = "Demo"
    end

    def create
        @article = Article.create(title: params[:article][:title], status: params[:article][:status], content: params[:article][:content])
        render json: @article
    end
    
end
