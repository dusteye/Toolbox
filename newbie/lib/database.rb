module Newbie
	class Database
		def initialize json_file
			@json_file = json_file
			@database = JSON.parse(File.open(json_file).read)
		end

		def find key
			@database.select do |record|
				record.any? do |s|
					s.include? key if s.respond_to? :include?
					s == key if s.respond_to? :==
				end
			end
		end

	
	end
end
