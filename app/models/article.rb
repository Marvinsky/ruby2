class Article < ActiveRecord::Base
	#la tabla => articles
	#Campos => articule.title() => 'title article'
	#escribir metodos
	belongs_to :user
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: {minimum: 20}
	#validates :username, format: {with: /regex/}
end
