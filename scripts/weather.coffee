Twit = require("twit")
Cron = require("cron").CronJob

config =
  consumer_key: process.env.HUBOT_TWITTER_CONSUMER_KEY
  consumer_secret: process.env.HUBOT_TWITTER_CONSUMER_SECRET
  access_token: process.env.HUBOT_TWITTER_ACCESS_TOKEN_KEY
  access_token_secret: process.env.HUBOT_TWITTER_ACCESS_TOKEN_SECRET

module.exports = (robot) ->
  new Cron(
    cronTime: '00 00 07 * * *'
    onTrick: ->
      doSearch(robot)
      return
    start: true
  )

doSearch = (robot) ->
  twit = new Twit config
  twit.get 'search/tweets', {q: "from:@Yahoo_weather #東京の天気", count: 1}, (err, data) ->
    if err
      console.log "Error getting tweets: #{err}"
      return
    if data.statuses? and data.statuses.length > 0
      robot.send {room: 'general'}, data.statuses[0].text
