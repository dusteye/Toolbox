# Information Transport Specification

This file described how the client and server communicate.

## On client log in

When client log in, a message as following will be sent to server.

```javascript
{
  "ip":"w.x.y.z",
  "github-id":github-id-here,
  "os-type":os-type,
  "action":"hello"
}
```

## On client log out

When clien log out, a message as following will be sent to server.

```javascript
{
  "ip":"w.x.y.z",
  "github-id":github-id-here,
  "action":"goodbye"
}
```

## Send query info

When client calls `newbie query something` it means use `something` as keyword to search the database. If any user is found, the server will return a json string. Otherwise a 'query:oops'. Samples are as following:

```javascript
/* $ newbie query sun */

/* This is what client send to server */
{
  "action":"query",
  "keywords":"sun"
}

/* This is what server returns */
[
  {
    "name":"Sun Peng",
    "nick":["Meng Meng"],
  },
  {
    "name":"Sun Tong",
    "nick":["Xie Jie"],
  }
]

/* $ newbie query admin@footoo.org */

/* This is what client send to server */
{
  "action":"query",
  "keywords":"admin@footoo.org"
}

/* This is what server returns */
"query:oops"
```

Noticed that client could use a specific column:

```shell
$ newbie query name:sun
```

Multiple keywords support is also avaliable.

```shell
$ newbie query name:sun favo:ruby
```

## Send a notification

You could send a notification to a man. If user online then server will send the client a notification, otherwise put the message into the user's message queue. If user not exist, server returns "notify:oops". Samples are as following:

```javascript
/* $ newbie notify "Sun Tong" "Give me the **Programming Ruby**." */

/* This is what client send to server */
{
  "action":"notify",
  "keyword":"Sun Tong",
  "message":"Give me the **Programming Ruby**."
}
```

### Recive notification from server

The client will recive a json string if a message try to send to it.

```javascript
{
  "action":"message",
  "from":"Cliff Woo",
  "message":"Give me the **Programming Ruby**."
}
```

## Send a file or director

Not implement yet.
