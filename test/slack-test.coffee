###
        slack-test.coffee: Test for instances of node-slack Transport
        (C) 2015 Michael Brandenburg
        MIT LICENCE
###
winston = require("winston")
config  = require("./config")
Slack = require("../lib/slack")
vows = require("vows")
assert = require("assert")
helpers = require("winston/test/helpers")

assertSlack = (transport) ->
  assert.instanceOf transport,Slack
  assert.isFunction(transport.log)

slackOptions = {
    team: config.team,
    channel: config.channel,
    token: config.token,
    emoji: config.emoji,
    username: config.username
}

transport = new Slack(slackOptions)

vows.describe("winston-slack").addBatch("An instance of the Slack Transport":
  "should have the proper methods defined": ->
    assertSlack transport
    return

  "the log() method": helpers.testNpmLevels(transport, "should respond with true", (ign, err, meta, result) ->
    assert.isTrue not err
    assert.isObject result
    return
  )
).export module
