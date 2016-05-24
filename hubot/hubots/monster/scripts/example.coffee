module.exports = ( robot ) ->
        robot.hear /devil/, (res) ->
                response = require( 'fs' ).readFileSync( "expected.txt" )
                console.log "Response #{response}"
                res.send response.toString()
