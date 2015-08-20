module ApplicationHelper
	require 'embedly'
	require 'json'

	def gravatar_for(user)
	    gravatar_id = Digest::MD5::hexdigest(current_user.email.downcase)
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
	    image_tag(gravatar_url, alt: current_user.first_name, class: "gravatar img-circle")
	end

	def gravatar_in_post(user)
		gravatar_id = Digest::MD5::hexdigest(user.email)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, class: 'gravatar-in-post img-responsive')
	end

	def display_title(url)
	  embedly_api = Embedly::API.new(key: '61734d55979846d29d4dbd2d41cac44e')
	  obj = embedly_api.oembed :url => url
	  obj.first.title
	end

	def display_thumb(url)
	  embedly_api = Embedly::API.new(key: '61734d55979846d29d4dbd2d41cac44e')
	  obj = embedly_api.oembed :url => url
	  obj.first.thumbnail_url
	end

	def display_description(url)
	  embedly_api = Embedly::API.new(key: '61734d55979846d29d4dbd2d41cac44e')
	  obj = embedly_api.oembed :url => url
	  obj.first.description
	end
end
