## 目的

在“墙内”拥有一个干净的 DNS 服务器。

## 原理

墙内 DNS 污染有两种形式：ISP DNS Cache 投毒和 GFW 旁路抢答。解决前者更改墙外的 DNS 服务器就行，比如：Google DNS，OpenDNS。

解决后者有点麻烦。因为目前的 DNS 查询是明文并且无状态的，GFW 在网关侦听 DNS 查询，对于需要污染的网站发来一个虚假的应答，造成墙外后来的真正的结果被丢弃。

因为考虑到成本和影响，GFW 的虚假应答有个特点，只能返回有限的少数十几个 IP 地址。收集到这些 IP；自动识别和抛弃虚假应答，就能等到真实结果。

## 平台

#### 服务端

- Ubuntu
- DNSMasq

#### 客户端 (可选的管理程序)

- UNIX-like

## 程序

#### 服务端

三个脚本，总共 24 行代码，含空行和注释，没有任何外部依赖。两个脚本用于收集虚假 IP，一个脚本用于编辑 Linux 防火墙。

#### 客户端

一个脚本用于手工编辑记录和设置。

## 部署

#### 服务端

```
$ sudo bash -c 'ruby list.rb | drop.sh'
```

### 客户端

链接命令：

```
$ sudo ln -s ./dns.sh /usr/local/sbin/dns
```

编辑 DNS 记录和设置：

```
$ dns edit hosts
$ dns edit conf
```
DNSMasq 支持使用通配符。

## 好处

### 总是获得真实的DNS查询结果

对程序员来说可能这点最有意义，遇到网络问题不用再考虑 DNS 查询结果的影响了。

对于普通网友，不用维护 Hosts 文件就能打开很多被 DNS 污染的网站，比如：https://www.facebook.com

另外，很多繁体字的网页都能打开了。

返回真实的结果还有一个好处是，调用 twitter 和 facebook 的网页很快就能打开，要么是正常打开，要么立刻迎来一个 RST，总之不用等连接虚假 IP 的 timeout 了。

### 团队共享手工和自动添加的记录和私有网址

由于 GFW 封锁 IP，DNS 查询返回的真实地址可能已经无法访问，需要经常手工调整 DNS 记录。团队可以共享这些“新鲜”的记录。另外，团队私有的 DNS 服务器支持私有网址，比如：

```
$ ftp lds
```

### 性能提升

团队成员经常访问相同网站，提高缓存的命中率。

## 已知问题

- 隐私。团队共享一个 DNS 缓存。
- 教育网和网通用户需要分开使用服务器，以解决 CDN 加速问题。

