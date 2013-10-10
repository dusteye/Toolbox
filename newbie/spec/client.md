# Newbie Client Specification

## Send somebody a notification

Noticed that you should quote the name if there are some whitespaces. The server will send the message to the fisrt person it find if there are more that one person found.

```shell
$ newbie notify "Cliff Woo" "give me the cup"
```

Notification only support OS X, Windows and Linux now.

## Send somebody a file or director

```shell
$ newbie file deathking *.c 
$ newbie dir deathking code
```

## Send somebody a mail

```shell
$ newbie mail yuri
```

## Query somebody\'s infomation

```shell
$ newbie query uncle.biao
```
