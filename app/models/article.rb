class Article < ActiveRecord::Base
	#la tabla => articles
	#Campos => articule.title() => 'title article'
	#escribir metodos
	belongs_to :user
	has_many :comments
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: {minimum: 20}
	#validates :username, format: {with: /regex/}
	#en el caso que tengas post creados antes de la implementacion del count haz:
	before_save :set_visits_count


	has_attached_file :cover, styles: {medium: "1280x720", thumb: "800x600"}
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	def update_visits_count
		self.save if self.visit_count.nil?
		self.update(visit_count: self.visit_count + 1)
	end


	private

	def set_visits_count
		self.visit_count ||= 0 #el or igual sirve para asignar zero en caso el elemento es nil
	end
end
