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
    cronTime: '00 30 06 * * *'
    onTick: ->
      robot.send {room: 'general'}, 'おはようございます！今日もいちにち頑張ろう！'
      return
    start: true
  )

module.exports = (robot) ->
  new Cron(
    cronTime: '00 00 00 * * *'
    onTick: ->
      robot.send {room: 'general'}, '今日もいちにちお疲れ様でした！'
      return
    start: true
  )

module.exports = (robot) ->
  new Cron(
    cronTime: '00 05 22 * * *'
    onTick: ->
      robot.send {room: 'general'}, '今日のレシートはカードホルダーに入れたかな？'
      return
    start: true
  )
