module Newbie

	class Request
	end

	class QueryRequest < Request

		def initialize keywords
			@keywords = keywords
		end

		def to_json(*a)
			{
				"keywords" => @keywords
			}.to_json(*a).gsub("\n","")
		end

		def self.json_create(json_str)
			new(json_str["keywords"])
		end

	end


	class NotifyRequest < Request
		
		def initialize keywords, message
			@keywords = keywords
			@message = message
		end

		def to_json(*a)
			{
				"keywords" => @keywords,
				"message" => @message
			}.to_json(*a).gsub('\n', '')
		end

		def self.json_create(json_str)
			new(json_str["keywords"], json_str["message"])
		end

	end

	class LiveRequest < Request
		def initialize
			@os = OS.type
			@github_id = JSON.parse(File.open("me.json").read)["github-id"]
		end
	end

	class LoginRequest < LiveRequest
		def initialize
			super
		end
		def to_json(*a)
			{
				"action"    => "hello",
				"github-id" => @github_id,
				"os"        => @os 
			}.to_json(*a)
		end
	end

	class HeartbeatRequest < LiveRequest

		def to_json(*a)
			{
				"action"    => "heartbeat",
				"github-id" => @github_id,
				"os"        => @os,
			}.to_json(*a)
		end
	end

	class LogoutRequest < LiveRequest

		def to_json(*a)
			{
				"action"    => "goodbye",
				"github-id" => @github_id
			}.to_json(*a).gsub("\n", "")

		end
	end

end
