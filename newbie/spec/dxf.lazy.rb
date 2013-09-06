source = File.open('book.txr').read
cliffs = JSON.parse('cliffs')

source.each_line do |line|
	information line do
		:qq.shoule_be Regexp::QQ
		:names.should_be Proc::Names
		:company.should_be Proc::Company
		:sid.should_be Regexp::Sid

		confirm_all_right
		write_little_cliffs cliffs, [:qq, :names, :company, :sid]

	end
end



