#!/usr/bin/env ruby

require 'socket'
require_relative 'lib/database.rb'

port = 6222

puts "[#{Time.now}] FoOTOo newbies server start on #{port}."
server = TCPServer.new(port)

while (session = server.accept)
	Thread.start do
		puts "[#{Time.now}] Connection from #{session.peeraddr[2]} at #{session.peeraddr[3]}."
		input = session.gets
		puts "[#{Time.new}] Client puts #{input}."
		session.puts "Server: Welcom #{session.peeraddr[2]}."
	end
end	
