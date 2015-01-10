# winston-for-slackers
A slack transport for winston

## Usage
``` js
winston = require('winston');
require('winston-for-slackers').Slack;
winston.add(winston.transports.Slack, options);
```

###Example Options
```js
options = {
    team: "testing",
    channel: "#general",
    token: "safhahfslshafu",
    emoji: ":smile:",
    username: "MCBrandenburg"
}
```

## Installation

### Installing winston-for-slackers

``` bash
$ npm install winston
$ npm install winston-for-slackers
```
