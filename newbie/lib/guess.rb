#encoding: utf-8


# There should be some dirty monkey-patch.

class String
	
	# Check whether a string is a non-ascii_strings. Implement it by simply
	# check it's length and bytesize.
	#
	def ascii_strings?
		length == bytesize
	end
end

class Symbol
	
	@attr_reader   :condition

	def should_be condition
		@condition = condition
	end

	def get_result text
		if condition.is_a? Regexp
			res = text.scan(condition)


end

infomation text  do
	:qq.should_be        Regexp[:qq]
	:name.should_be      Proc[:name]
	:emails.should_be    Proc[:emails]
	:company.should_be   Proc[:company]

	confirm_all_right
	write_database :qq, :name, :emails, :company 
end


