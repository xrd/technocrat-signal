
slackUtils = require "../lib/slack-utils"

describe "all", ->
  it "should properly parse a URL and give us back the reference", (done) ->
    url = "https://webiphany.slack.com/files/xrd/F1AQK1BQQ/-.java"
    expect( slackUtils.getFileReference( url ) ).toEqual( "F1AQK1BQQ" )
    done()
