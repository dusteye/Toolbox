dist	".cliffs"
origin	stdin

item "newbie" do
	only_one	:qq
	not_null	:name

	:qq.should_be	/\d{9,11}/
	:name.should_be		Baijiaxing.is_a_chinese_name?
	:company.should_be	//

	check_all_right
	write_database :qq, :company
end

