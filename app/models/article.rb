class Article < ActiveRecord::Base
	#la tabla => articles
	#Campos => articule.title() => 'title article'
	#escribir metodos
	belongs_to :user
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: {minimum: 20}
	#validates :username, format: {with: /regex/}
	#en el caso que tengas post creados antes de la implementacion del count haz:
	before_save :set_visits_count


	def update_visits_count
		self.save if self.visit_count.nil?
		self.update(visit_count: self.visit_count + 1)
	end


	private

	def set_visits_count
		self.visit_count ||= 0 #el or igual sirve para asignar zero en caso el elemento es nil
	end
end
