class AppsController < ApplicationController

	def json_parse
		response = HTTParty.get('skola-str.herokuapp.com')
		body = JSON.parse(response.body)
		ucenik = NoviUcenik.new
		ucenik.name = body["name"]
		ucenik.save
	end

end
