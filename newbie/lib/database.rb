module Newbie
	class Database
		def initialize json_file
			@json_file = json_file
			@database = JSON.parse(File.open(json_file).read)
		end

		def find key

		end
	end
end
