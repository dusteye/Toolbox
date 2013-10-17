#!/usr/bin/env ruby

require 'json'
require 'socket'

require_relative 'lib/database.rb'

port = 6222

puts "[#{Time.now}] FoOTOo newbies server start on #{port}."
server = TCPServer.new(port)

while session = server.accept
	Thread.start do

		while input = session.gets
			rcv = JSON.parse input
			puts rcv.inspect
		end
		session.puts ""
	end
end


