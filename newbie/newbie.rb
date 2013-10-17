#!/usr/bin/env ruby

require 'socket'
require 'lib/request'

port = 6222
host = "localhost"
server = TCPSocket.new(host, port)


case ARGV[0]
when "notify"
	if ARGV[1].nil?
		puts "usage: newbie notify to_whom what"
		exit
	end
	server.puts Newbie::NotifyReques.new(ARGV[1], ARGV[0]).to_json	

when "query"

when "help"
	
end

