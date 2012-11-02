for orgname in `find . -name "*.md"`;
do
    ruby md_url_process.rb $orgname > ../md/$orgname
done
