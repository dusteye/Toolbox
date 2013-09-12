#encoding: utf-8

# Warning! 
# There should be some dirty monkey-patch. Don't use this in your
# very import project.

class Symbol
	
	@attr_reader   :condition

	def should_be condition
		@condition = condition
	end

	def transform_binding method
		@transform_by = method
	end

	def transform
		@value.send(@transform_by)
	end

end
