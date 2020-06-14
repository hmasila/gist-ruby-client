# frozen_string_literal: true

module Gist
	class Conversation
		class << self
			def list_conversations(order: "desc", status: "all", sort: "updated_at")
	    	params = {
	    		order: order,
	    		status: status,
	    		sort: sort
	    	}
	    	Gist::Client.connect(params: params, method: :get, endpoint: "conversations")
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
	    	Gist::Client.connect(payload: payload, method: :post, endpoint: "conversations")
	    end

	    def get_conversation(id:)
	    	Gist::Client.connect(method: :get, endpoint: "conversations/#{id}")
	    end

	    def delete_conversation(id:)
	    	Gist::Client.connect(method: :delete, endpoint: "conversations/#{id}")
	    end

	    def assign_conversation(assignee_id: nil, teammate_id: , id:)
	    	payload = {
	    		teammate_id: teammate_id,
	    		assignee_id: assignee_id
	    	}
	    	Gist::Client.connect(payload: payload, method: :patch, endpoint: "conversations/#{id}/assign")
	    end

	    def snooze_conversation(snooze_until: nil, teammate_id:, id:)
	    	payload = {
	    		teammate_id: teammate_id,
	    		state: "snoozed",
	    		snooze_until: snooze_until
	    	}
	    	Gist::Client.connect(payload: payload, method: :patch, endpoint: "conversations/#{id}")
	    end

	    def reopen_conversation(teammate_id:, id:)
	    	payload = {
	    		teammate_id: teammate_id,
	    		state: "open"
	    	}
	    	Gist::Client.connect(payload: payload, method: :patch, endpoint: "conversations/#{id}")
	    end

	    def close_conversation(teammate_id:, id:)
	    	payload = {
	    		teammate_id: teammate_id,
	    		state: "closed"
	    	}
	    	Gist::Client.connect(payload: payload, method: :patch, endpoint: "conversations/#{id}")
	    end

	    def prioritize_conversation(priority: "priority", teammate_id:, id:)
	    	payload = {
	    		teammate_id: teammate_id,
	    		priority: priority
	    	}
	    	Gist::Client.connect(payload: payload, method: :patch, endpoint: "conversations/#{id}/priority")
	    end

	    def retrieve_conversation_count
	    	Gist::Client.connect(method: :get, endpoint: "conversations/count")
	    end

	    def retrieve_conversation_messages
	    	Gist::Client.connect(method: :get, endpoint: "conversations/messages")
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
	    	Gist::Client.connect(payload: payload, method: :get, endpoint: "conversations/#{conversation_id}/messages")
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
	    	Gist::Client.connect(payload: payload, method: :get, endpoint: "conversations/#{conversation_id}/messages")
	    end
		end
	end
end