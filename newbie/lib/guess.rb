#encoding: utf-8

# Warning! 
# There should be some dirty monkey-patch. Don't use this in your
# very import project.

class String
	
	# Check whether a string is a non-ascii_strings.
	# This is a enumerate version, and would be faster than ever
	def ascii_strings?
		each_byte.any? {|c| c > 128}
	end
end

class Symbol
	
	@attr_reader   :condition

	def should_be condition
		@condition = condition
	end

end