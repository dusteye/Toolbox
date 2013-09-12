dist	".cliffs"
origin	stdin


task :setup_database  do
	only_one	:qq
	not_null	:name

	bunding_with :to_i, :qq, :sid, :id
	bunding_with :to_s, :company, :name

	:qq.should_be	    /^\d{5,10}$/
	:id.should_be     /^\d{17,17}[0-9xX]$/
	:sid.should_be    //
	:name.should_be		Baijiaxing.is_a_chinese_name?
	:company.should_be	

	check_all_right
	write_database :qq, :company
end

