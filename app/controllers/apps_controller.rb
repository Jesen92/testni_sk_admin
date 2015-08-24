class AppsController < ApplicationController
	  include HTTParty
skip_before_filter  :verify_authenticity_token

  def create
	response = HTTParty.get('http://localhost:3000/apps/create')
	body = JSON.parse(response.body)
	@ucenik = NoviUcenik.new(ucenik_params)
	@ucenik.name = body["name"]
	@ucenik.save
  end

  private
    def ucenik_params
    params.require(:novi_ucenik).permit(:name)
  end
end
