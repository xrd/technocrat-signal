


initialized = false

buildFileApiUrl = ( ref ) ->
        # https://slack.com/api/files.info?token=xxx-123123123&file=F1AP7BS5T&pretty=1
        "https://slack.com/api/files.info?token=" +
        process.env.HUBOT_SLACK_TOKEN +
        "&file=#{ref}&pretty=1"

# Given this: https://webiphany.slack.com/files/xrd/F1AQK1BQQ/-.java
# Get back this: F1AQK1BQQ
getFileReference = ( url ) ->
        chunks = url.split( '/' ) if url
        chunks[chunks.length-2] # second to last item.

module.exports = (robot) ->

        robot.hear /brain explosion with this code: (.*)/, (res) ->
                console.log "Match: #{res.match[1]}"
                res.send "A cry for help!"

        # this does not work if you add code snippet and say @technocrat: snippet...
        robot.respond /snippet/, (res) ->
                console.log "Input: ", res.match.input
                res.send "You talking to me?"

        robot.hear /code confusion/, (res) ->
                console.log "Input: ", res.match.input
                fileReference = getFileReference( res.match.input )
                console.log "Ref: #{fileReference}"
                slackApiUrl = buildFileApiUrl( fileReference )
                classifierApiUrl = "http://#{process.env.CLASSIFIER_1_PORT_4567_TCP_ADDR}:4567/classify"
                console.log "Classifier URL: #{classifierApiUrl}"

                robot.http( slackApiUrl ).get() ( slackErr, slackRes, slackBody ) ->
                        code = JSON.parse( slackBody ).content
                        console.log "Code retrieved from Slack: #{code}"
                        encoded = "code=#{encodeURIComponent(code)}"
                        robot.http( classifierApiUrl ).post( encoded ) ( classifierError, classifierRes, classifierBody ) ->
                                        console.log "Error", classifierError
                                        console.log "classifierBody is #{ classifierBody }"
                                        classified = JSON.parse( classifierBody )
                                        if classified.type
                                                robot.brain.set classified.type, "on"
                                                res.send "Sending out the #{classified.type} technocrat signal!!!"
                                        else
                                                res.send "Can't recognize this code, sorry"



        robot.hear /wrong, that's (.*)/, (res) ->
                classifierApiUrl = "http://#{process.env.CLASSIFIER_1_PORT_4567_TCP_ADDR}:4567/train/#{res.match[1]}"
                console.log "Classifier URL: #{classifierApiUrl}"
                lastCode = robot.brain.get 'last'
                encoded = "code=#{lastCode}"
                robot.http( classifierApiUrl ).post( encoded ) ( classifierError, classifierRes, classifierBody ) ->
                        classified = JSON.parse( classifierBody )
                        if 'ok' == classified.status
                                res.send "Oops, my bad, recategorized that code as #{res.match[1]}"

        robot.router.get '/hubot/status', (req, res) ->
                initialized = robot.brain.get 'initialized'
                unless initialized
                  for x in [ 'Java', 'Ruby' ]
                    robot.brain.set x, "off"
                  robot.brain.set 'initialized', true
                # this is a private API, so could change!
                res.send robot.brain.data._private
