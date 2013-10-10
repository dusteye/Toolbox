# Newbie Server Sepcification

## User Database

The Newbie server must maintain a database for FoOTOo newbies. The format isn\'t specified, but we recommand JSON file or sqlite database.

### User Pool

Server should maintain a user pool, so that it can know which user is online and other infomation.

## Message Queue

Server must have a message queue for every user so that when a user was offlien and a notification to him was sent, then server should put that notification to the message queue. When the user was online, the server should send the notification. The queue size should be limited. The expire also should be limited. Whether send a notification to the original message sender is under disscusion.

