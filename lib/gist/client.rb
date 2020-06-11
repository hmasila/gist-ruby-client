# frozen_string_literal: true

module Gist
  class Client
    API_URL = 'https://api.getgist.com'

    attr_accessor :access_token

    def initialize(access_token)
      @access_token = access_token
    end

    def connect(payload: {}, params: {}, method:, endpoint:)
    	RestClient::Request.execute(
			  method: method,
			  url: "#{API_URL}/#{endpoint}",
			  payload: payload,
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

    def create_conversation(user_id: nil, email: nil, id:, body:, from:)
    	payload = {
	      from: {
	        id: id,
	        user_id: user_id,
	        email: email
	      },
	      body: body
    	}
    	connect(payload: payload.to_json, method: :post, endpoint: "conversations")
    end

    def get_conversation(id:)
    	connect(method: :get, endpoint: "conversations/#{id}")
    end

    def delete_conversation(id:)
    	connect(method: :delete, endpoint: "conversations/#{id}")
    end

    def assign_conversation(assignee_id: nil, teammate_id: , id:)
    	payload = {
    		teammate_id: teammate_id,
    		assignee_id: assignee_id
    	}
    	connect(payload: payload.to_json, method: :patch, endpoint: "conversations/#{id}/assign")
    end

    def snooze_conversation(snooze_until: nil, teammate_id:, id:)
    	payload = {
    		teammate_id: teammate_id,
    		state: "snoozed",
    		snooze_until: snooze_until
    	}
    	connect(payload: payload.to_json, method: :patch, endpoint: "conversations/#{id}")
    end

    def reopen_conversation(teammate_id:, id:)
    	payload = {
    		teammate_id: teammate_id,
    		state: "open"
    	}
    	connect(payload: payload.to_json, method: :patch, endpoint: "conversations/#{id}")
    end

    def close_conversation(teammate_id:, id:)
    	payload = {
    		teammate_id: teammate_id,
    		state: "closed"
    	}
    	connect(payload: payload.to_json, method: :patch, endpoint: "conversations/#{id}")
    end

    def prioritize_conversation(priority: "priority", teammate_id:, id:)
    	payload = {
    		teammate_id: teammate_id,
    		priority: priority
    	}
    	connect(payload: payload.to_json, method: :patch, endpoint: "conversations/#{id}/priority")
    end

    def list_conversations(order: "desc", status: "all", sort: "updated_at")
    	params = {
    		order: order,
    		status: status,
    		sort: sort
    	}
    	connect(params: params, method: :get, endpoint: "conversations")
    end

    def retrieve_conversation_count
    	connect(method: :get, endpoint: "conversations/count")
    end

    def reply_to_contact(user_id: nil, email: nil, message_type: "reply", id: nil, body:, conversation_id:)
    	payload = {
    		message_type: message_type,
	      from: {
	        id: id,
	        user_id: user_id,
	        email: email,
	        type: contact
	      },
	      body: body
    	}
    	connect(payload: payload.to_json, method: :get, endpoint: "conversations/#{conversation_id}/messages")
    end

    def reply_to_teammate(message_type: "reply", teammate_id: , body:, conversation_id:)
    	payload = {
    		message_type: message_type,
	      from: {
	        type: "teammate",
	        teammate_id: teammate_id
	      },
	      body: body
    	}
    	connect(payload: payload.to_json, method: :get, endpoint: "conversations/#{conversation_id}/messages")
    end
  end
end
