class ArticlesController < ApplicationController
	#before_action :validate_user, except: [:show, :index]
	before_action :authenticate_user!, except: [:show, :index]  #devise inyecta en el controlador
	# show and index porque quiero que lean mis articulos sin haber iniciado sesion
	before_action :set_article, except: [:index, :new, :create]
	# GET /articles
	def index
		#todos los registros
		@articles =	Article.all
	end

	#get /articles/:id
	def show
		#encuentra registro por id
		#@article = Article.find(params[:id])
		#where no interpolar una cadena: Es inseguro
		#Article.where(" body LIKE ?", params[:body])
		@article.update_visits_count
		@comment = Comment.new
	end

	#GET /articles/new
	def new
		@article = Article.new
		@categories = Category.all
	end

	#POST /articles
	def create
		#@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		@article = current_user.articles.new(article_params)  #not safe
		@article.categories = params[:categories]
		#@article.valid?
		if @article.save
			redirect_to @article
		else
			render :new
		end	
	end


	#DESTROY /articles/:id
	def destroy
		#@article = Article.find(params[:id])
		@article.destroy #destroy elimina el objeto de la base de datos
		redirect_to articles_path
	end

	def edit
		#@article = Article.find(params[:id])
	end

	#PUT /articles/:id
	def update
		#@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			redirect_to @article
		else 
			render :edit
		end
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	#def validate_user
	#	redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
	#end

	def article_params
		params.require(:article).permit(:title,:body,:cover,:categories)
	end


end
