for orgname in `find . -name *.html`;
do
    ###newname=`echo $orgname | sed -n ‘s/.html/.md/p’`  
    mv $orgname ./markdown/
done
