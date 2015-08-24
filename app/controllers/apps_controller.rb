class AppsController < ApplicationController

	def json_parse
		response = HTTParty.get('https://skola-str.herokuapp.com/json_parse')
		body = JSON.parse(response.body)
		ucenik = NoviUcenik.new
		ucenik.name = body["name"]
		ucenik.save
	end

end
