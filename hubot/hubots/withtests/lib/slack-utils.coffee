exports.buildFileApiUrl = ( ref ) ->
        # https://slack.com/api/files.info?token=xxx-123123123&file=F1AP7BS5T&pretty=1
        "https://slack.com/api/files.info?token=" +
        process.env.HUBOT_SLACK_TOKEN +
        "&file=#{ref}&pretty=1"

# Given this: https://webiphany.slack.com/files/xrd/F1AQK1BQQ/-.java
# Get back this: F1AQK1BQQ
exports.getFileReference = ( url ) ->
        chunks = url.split( '/' ) if url
        chunks[chunks.length-2] # second to last item.
