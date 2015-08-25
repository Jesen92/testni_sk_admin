class AndroidsController < ApplicationController
	require 'httparty'

	skip_before_filter  :verify_authenticity_token

  def get_json
  	response = HTTParty.get('http://skola-str.herokuapp.com/androids/get_json')
	body = JSON.parse(response.body)
	@ucenik = NoviUcenik.new(ucenik_params)
	@ucenik.name = body["name"]
	@ucenik.save
  end
end
