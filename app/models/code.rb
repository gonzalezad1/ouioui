class Code < ActiveRecord::Base

	belongs_to :user
	validates :code, uniquness: true 

	def code_generator
		code = (("A".."Z").to_a.sample(1) + (0..9).to_a.sample(4)).join
	end
end
