// Generated by CoffeeScript 1.8.0

/*
        slack-test.coffee: Test for instances of node-slack Transport
        (C) 2015 Michael Brandenburg
        MIT LICENCE
 */

(function() {
  var Slack, assert, assertSlack, config, helpers, slackOptions, transport, vows, winston;

  winston = require("winston");

  config = require("./config");

  Slack = require("../lib/slack");

  vows = require("vows");

  assert = require("assert");

  helpers = require("winston/test/helpers");

  assertSlack = function(transport) {
    assert.instanceOf(transport, Slack);
    return assert.isFunction(transport.log);
  };

  slackOptions = {
    team: config.team,
    channel: config.channel,
    token: config.token,
    emoji: config.emoji,
    username: config.username
  };

  transport = new Slack(slackOptions);

  vows.describe("winston-slack").addBatch({
    "An instance of the Slack Transport": {
      "should have the proper methods defined": function() {
        assertSlack(transport);
      },
      "the log() method": helpers.testNpmLevels(transport, "should log messages to slack", function(ign, err, meta, result) {
        assert.isTrue(!err);
        assert.isObject(result);
      })
    }
  })["export"](module);

}).call(this);