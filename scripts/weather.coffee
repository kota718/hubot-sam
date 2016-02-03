Twit = require("twit")
Cron = require("cron").CronJob

config =
  consumer_key: process.env.HUBOT_TWITTER_CONSUMER_KEY
  consumer_secret: process.env.HUBOT_TWITTER_CONSUMER_SECRET
  access_token: process.env.HUBOT_TWITTER_ACCESS_TOKEN_KEY
  access_token_secret: process.env.HUBOT_TWITTER_ACCESS_TOKEN_SECRET

module.exports = (robot) ->
  new Cron(
    cronTime: '0 0 7 * * *',
    onTrick: doSearch(robot),
    start: true
  )

doSearch = (robot) ->
 robot.respond /天気/, (res) ->
   twit = new Twit config
   twit.get 'search/tweets', {q: "from:@Yahoo_weather #東京の天気", count: 1}, (err, data) ->
     if err
       console.log "Error getting tweets: #{err}"
       return
     if data.statuses? and data.statuses.length > 0
       res.send {room: '#general'}, data.statuses[0].text
