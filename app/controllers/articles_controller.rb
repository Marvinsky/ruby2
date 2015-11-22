class ArticlesController < ApplicationController
	# GET /articles
	def index
		#todos los registros
		@articles =	Article.all
	end

	#get /articles/:id
	def show
		#encuentra registro por id
		@article = Article.find(params[:id])
		#where no interpolar una cadena: Es inseguro
		#Article.where(" body LIKE ?", params[:body])
	end

	#GET /articles/new
	def new
		@article = Article.new
	end

	#POST /articles
	def create
		#@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		@article = Article.new(article_params)  #not safe
		#@article.valid?
		if @article.save
			redirect_to @article
		else
			render :new
		end	
	end


	#DESTROY /articles/:id
	def destroy
		@article = Article.find(params[:id])
		@article.destroy #destroy elimina el objeto de la base de datos
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	#PUT /articles/:id
	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			redirect_to @article
		else 
			render :edit
		end
	end

	private
	def article_params
		params.require(:article).permit(:title,:body)
	end


end
