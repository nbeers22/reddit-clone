class Link < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	has_many :comments
	acts_as_votable

	def self.add_http(link)
		link.downcase!
		if link.include?('http://')
			link
		else
			link = 'http://' + link
		end
	end
end
