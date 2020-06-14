# frozen_string_literal: true

module Gist
  class Client
    API_URL = 'https://api.getgist.com'

    class << self
	    attr_accessor :access_token

	    def connect(payload: {}, params: {}, method:, endpoint:)
	    	RestClient::Request.execute(
				  method: method,
				  url: "#{API_URL}/#{endpoint}",
				  payload: payload.to_json,
				  headers: {
				  	content_type: 'application/json',
				  	Authorization: "Bearer #{@access_token}",
				  	params: params
				  }) do |response, request, result|
				  case response.code
				  when 400
				    [ :error, JSON.parse(response.to_str) ]
				  when 200
				    [ :success, JSON.parse(response.to_str) ]
				  else
				    fail "Invalid response #{response.to_str} received."
				  end
				end

			rescue RestClient::Unauthorized, RestClient::Forbidden => err
			  JSON.parse(err.response.to_str)
	    end
	  end
  end
end
