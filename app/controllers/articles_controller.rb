class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end
    def edit
        @article = Article.find(params[:id])     
    end
    def new
        #Creamos un nuevo articulo vacío
        #Una variable con @, es una variable que se pasa del controlador a la vista
        #Una variable sin @, es una variable que solo existe localmente
        @article = Article.new
    end

    def create
        @article = Article.create(title: params[:article][:title], status: params[:article][:status])
        render json: @article
    end
    def update
        @article = Article.find(params[:id])
        @article.update(title: params[:article][:title], content: params[:article][:content], status: params[:article][:status])
        render json: @article
        redirect_to @article
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to root_path
    end
    
end
