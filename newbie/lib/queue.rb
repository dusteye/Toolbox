module Newbie
	
  Message = Struct.new(:msg, :from, :expires) do
		def dead?
			@expires <= 0
		end

		def to_json(*a)
			{
			  "action"  => "message",
				"from"    => @from,
				"message" => @msg
			}.to_json(*a)
		end
	end

	class MessageQueue

		QUEUE_MAX = 20

		def initialize
			@data = []
		end

		def push msg
			return false if @data.size >= QUEUE_MAX
			@data.push msg
		end

		def shift
			@data.shift
		end

		def empty?
			@data.empty?
		end
	
		# update the message queue
		# delete some out-of-time message
		def update step
			tbd = []
			@data.each_with_index do |element, index|
				element.expires -= step
				tbd << index if element.dead?
			end
			unless tbd.empty?
				tbd.reverse.each do |i|
					@data.delete_at i
				end
			end
		end
		
	end
end
