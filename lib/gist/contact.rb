module Gist
	class Contact
		class << self
			def create_or_update_contact(user_id: nil, email: nil, id: nil, name: nil,
				phone: nil, signed_up_at: nil, last_seen_ip: nil, last_seen_user_agent: nil,
				custom_properties: {}, unsubscribed_from_emails: false, tags: [])
	    	payload = {
		      id: id,
	        user_id: user_id,
	        email: email,
	        name: name,
	        phone: phone,
	        signed_up_at: signed_up_at,
	        last_seen_ip: last_seen_ip,
	        last_seen_user_agent: last_seen_user_agent,
	        custom_properties: custom_properties,
	        unsubscribed_from_emails: false, 
	        tags: tags
	    	}
	    	Gist::Client.connect(payload: payload, method: :post, endpoint: "contacts")
	    end
	  end
	end
end