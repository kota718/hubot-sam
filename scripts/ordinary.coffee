# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

Cron = require('cron').CronJob

module.exports = (robot) ->
  new Cron(
    cronTime: '0 30 6 * * *',
    onTrick: -> 
      robot.send {room: '#general'}, 'おはようございます！今日もいちにち頑張ろう！',
    start: true
  )

module.exports = (robot) ->
  new Cron(
    cronTime: '0 0 0 * * *',
    onTrick: ->
      robot.send {room: '#general'}, '今日もいちにちお疲れ様でした！',
    start: true
  )
    
module.exports = (robot) ->
  new Cron(
    cronTime: '0 0 21 * * *',
    onTrick: -> 
      robot.send {room: '#general'}, '今日のレシートはカードホルダーに入れたかな？',
    start: true
  )
