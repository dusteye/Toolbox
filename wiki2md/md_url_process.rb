# encoding: UTF-8

def URLDecode(str)
  if str =~ /%[a-fA-F0-9]/ then
    return str.gsub!(/%[a-fA-F0-9]{2}/) { |x| x = x[1..2].hex.chr }
  else
    return str
  end
end

str = File.read(ARGV[0])
str.gsub!(/^\[\[编辑.[^\)]*\)\]\n/m, "")
str.gsub!(/^取自\"\[[\s\S]*\n/m, "")
str.gsub!(/^\[首页[\s\S]*\[帮助\]\([^\)]*\)\n/m, "")
str.gsub!(/&nbsp_place_holder;\n/, "")
pattern = /(?<name>\[[^\]]*\])\((?<url>[^\)]*)\)/
str.gsub!(pattern) do
  url =  $~[:url]
  name =  $~[:name]
  array = []
  others = ""
  if url =~ /^http:\/\// then
	"#{name}(#{url})"
  else
    array = url.split(/ /)
    (1..array.size-1).each do |index|
       others += " #{array[index]}"
    end
    temp_array = array[0].split(/\//)
    url = URLDecode(array[0].split(/\//)[-1].gsub(/\.html/, ""))
  if array.size > 1
    "#{name}(https://github.com/FoOTOo/FoOTOo-Lab/wiki/#{url.force_encoding("UTF-8")}#{others})"
  elsif array.size == 1
    "#{name}(https://github.com/FoOTOo/FoOTOo-Lab/wiki/#{url.force_encoding("UTF-8")})"
  end
  end
end

print str
