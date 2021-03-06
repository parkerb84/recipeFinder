class Recipe < ActiveRecord::Base
	include HTTParty
	ENV["FOOD2FORK_KEY"] = '47a55cf06065e64c4fba40c97364d74b'
	ENV["FOOD2FORK_SERVER_AND_PORT"] = 'www.food2fork.com'
	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: key_value
	format :json

	def self.for keyword
		get("/search", query: {q: keyword})["recipes"]
	end

end