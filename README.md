# winston-for-slackers
A slack transport for winston


## Installation

### Installing winston-for-slackers

``` bash
$ npm install winston
$ npm install winston-for-slackers
```

## Usage

``` js
winston = require('winston');
require('winston-for-slackers').Slack;
winston.add(winston.transports.Slack, options);
```

###Options
*team*
your team.slack.com

*channel*
The channel you want these alerts to be posted to.

*token*
Your token (https://hooks.slack.com/services/something/something/token)

*emoji*:
The emoji you want to use, defaults to ':page_with_curl:'

*username*
The username that you want the bot to use, defaults to 'Winston'

####Example Options

```coffee
options = {
    team: "testing",
    channel: "#general",
    token: "safhahfslshafu",
    emoji: ":smile:",
    username: "MCBrandenburg"
}
```
