class ArticlesController < ApplicationController
	# GET /articles
	def index
		@articles =	Article.all
	end

	#get /articles/:id
	def show
		@article = Article.find(params[:id])
	end

end
