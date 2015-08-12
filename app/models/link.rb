class Link < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	def self.add_http(link)
		link.downcase!
		if link.include?('http://')
			link
		else
			link = 'http://' + link
		end
	end
end
