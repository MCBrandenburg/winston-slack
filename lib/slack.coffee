###
slack.coffee: Transport for outputting to Slack
(C) 2015 Michael Brandenburg
MIT LICENCE
###

nodeSlack = require('node-slack')
winston = require('winston')
util = require('util')

class Slack
    constructor:(options)->
        winston.Transport.call this,options
        options = options or {}

        @name = "node-slack"
        @token = options.token
        @team = options.team
        @channel = options.channel
        @slack = new nodeSlack @team,@token
        @emoji = options.emoji or ":page_with_curl:"
        @username = options.username or "Winston"

    util.inherits Slack,winston.Transport

    winston.transports.Slack = Slack

    Slack::name = "slack"

    log:(level,msg,meta,callback)->
        return callback null,true if @silent

        self = @

        slackJSON= {
            text:msg,
            channel: @channel,
            username: @username,
            icon_emoji: @emoji
        }

        @slack.send(slackJSON, callback)

module.exports = Slack
