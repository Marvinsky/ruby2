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
		@article = Article.new(title: params[:article][:title], body: params[:article][:body])
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

	#PUT /articles/:id
	def update
		#@article.update_attributes({tile: new title})
	end

end
