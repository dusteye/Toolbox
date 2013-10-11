module Newbie

	class Request
	end

	class QueryRequest < Request

		def initialize action, keywords
			@action = action
			@keywords = keywords
		end

		def to_json(*a)
			{
				"action" => @action,
				"keywords" => @keywords
			}.to_json(*a)
		end

		def self.json_create(json_str)
			new(json_str["action"], json_str["keywords"])
		end

	end


	class NotifyRequest < Request
		
		def initialize action, keywords, message
			@action = action
			@keywords = keywords
			@message = message
		end

		def to_json(*a)
			{
				"action" => @action,
				"keywords" => @keywords,
				"message" => @message
			}
		end

		def self.json_create(json_str)
			new(json_str["action"], json_str["keywords"], json_str["message"])
		end

	end

end
