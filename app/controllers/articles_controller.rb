class ArticlesController < ApplicationController
    #before_action :validate_user, except: [:show, :index]
    before_action :authenticate_appuser!, except: [:show,:index]
    before_action :set_article,except:[:index,:new,:create]
    #before_action :authenticate_appuser!
    #GET /article
    def index
    @articles = Article.all
    end     

    #GET / article/:id
    def show  
        @article.update_visits_count
        @comment = Comment.new

    end

    def new
        @article = Article.new
    end

    #POST /article
    def create 
        @article = current_appuser.articles.new(article_params) 
        #@article = Article.new(title: params[:article][:title],body: params[:article][:body]) 
        

        if @article.save
        redirect_to @article
        else
            render template: "articles/new"
            #render :new            
        end
    end

    def edit
    end

    #put /article/:id
    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end 

    def destroy
         @article.destroy
         redirect_to articles_path
    end


    private

    def article_params
        params.require(:article).permit(:title,:body)
    end

    def validate_user
        redirect_to new_appuser_session_path, notice: "Es necesario iniciar sesion"
    end

    def set_article
        @article = Article.find(params[:id])
    end

end