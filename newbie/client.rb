#!/usr/bin/env ruby
require 'json'
require 'socket'
require 'terminal-notifier'

require_relative 'lib/os'
require_relative 'lib/request'

config = JSON.parse File.open("config.json").read

clientSession = TCPSocket.new(config["server"], config["port"])
clientSession.puts Newbie::LoginRequest.new.to_json

def process_message jstr
	TerminalNotifier.notify jstr[:message]
end

until clientSession.closed?


	while returns = clientSession.gets
		rcv = JSON.parse returns
		case rcv["action"]
		when "message"
			process_message(rvc)
		end
	end
	
end


puts "[#{Time.now}] Client closed."
