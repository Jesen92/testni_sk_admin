class AndroidsController < ApplicationController
  require 'httparty'

  skip_before_filter  :verify_authenticity_token

def get_json
 response = HTTParty.get("http://localhost:3000/androids/get_json")
end

  private
    def ucenik_params
    params.require(:novi_ucenik).permit(:name)
  end
end