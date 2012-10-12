FoOTOo Git 注意事项
-------------------

-   由于使用了hook方式发送邮件，因此在大家使用git
    push向主版本库提交时需要等待hook脚本运行完毕，整个过程需要与服务器保持连接，会有短暂的停顿，请大家误以为系统无响应。

FoOTOo Git 使用指南
-------------------

-   Git环境设置参考[Pro
    Git](http://progit.org/book/zh/ch1-5.html)的用户信息部分，其中user.name
    设置为姓名全拼 ，user.email设置为Gmail账户

<!-- -->

    $ git config --global user.name "sunpeng"
    $ git config --global user.email voidmain1313113@gmail.com

-   参考[Git公钥生成指南](http://progit.org/book/zh/ch4-3.html) 生成公钥
    1.  生成公钥的注释信息请采用username@host的方式username
        为用户名，与Git用户信息设置中的user.name
        相同，使用姓名全拼，host为使用主机标识符，可以用IP也可以用主机名
    2.  如果大家有多台开发机，请生成多个公钥，并按照如下方式命名
    3.  公钥缺省命名为id\_rsa.pub ，生成后以
        username.pub的方式命名:username
        为用户名，与Git用户信息设置中的user.name 相同，使用姓名全拼

-   将公钥保存至 \\\\172.16.0.46\\Development\\Developer\_Pub\_Key ，并给
    cliffwoo@gmail.com发送邮件
-   cliffwoo@gmail.com将公钥导入后会以邮件或者口头通知的方式确认

-   完成上述工作后，可以使用如下方式获取项目,其中project\_name为项目的名称

<!-- -->

    git clone ssh://git@git.footoo.org:project_name.git

-   项目的创建

要想创建一个新的项目，需要登录到服务器创建（目前暂时没有web端，不过很快会进行开发）。
具体的项目创建过程包括：

-   1.  向cliff老师申请gitosis-admin项目的提交权限；
    2.  修改本地gitosis-admin项目文件夹下的gitosis.conf文件，按照之前的项目添加一个group段落，修改之后提交
    3.  在本地新建一个项目目录，使用git init; git remote add origin
        git@git.footoo.org:YOUR\_PROJECT\_NAME.git; git push -u origin
        master来创建这个项目的仓库
    4.  之后，登陆到219.217.227.120这台服务器上，配置位于/home/git/repositories/YOUR\_PROJECT\_NAME/下的文件，包括description（修改为一个只有一行的文件，内容为项目名称），config以及hooks文件夹下的文件（复制config、hooks/post-receive、hooks/functions）。

至此项目创建完成

但是这样做非常复杂，所以我开发了一个脚本，直接通过脚本就可以生成项目，过程是：以git用户的身份登录到服务器上，进入\~/EasyGit/script文件夹，使用'python
init\_repo.py PROJECT\_NAME
MEMBER\_LIST'来创建项目，其中PROJECT\_NAME是项目名称，MEMBER\_LIST是一个以空格分割的成员列表，成员名称根据keydir中定义的名称设置

FoOTOo Git资源
--------------

1.  FoOTOo Git服务器:git.footoo.org
2.  FoOTOo 代码审查服务器 ：gerrit.footoo.org
    ,具体的使用方法请参考视频教程
    \\\\172.16.0.46\\IBM\_Center\\Talk\\2012\\2012-03-31\_FCL及CodeReview

参考文献
--------

### GIT使用指南

1.  [Pro GIT](http://progit.org/book/zh/)：推荐阅读！！！
2.  [Git开发管理之道](http://blog.leezhong.com/translate/2010/10/30/a-successful-git-branch.html)
3.  [https://github.com/cliffwoo/Training/blob/master/TODO GIT习题]
4.  [EGit下配置Github](http://www.lifebackup.cn/config_github_via_egit.html)
5.  [Markdown的编辑器](http://www.appinn.com/markdown-tools/)

### EGIT使用指南

[EGIT 用户手册](http://wiki.eclipse.org/EGit/User_Guide)
