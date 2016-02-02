# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot おみくじ

module.exports = (robot) ->
  robot.respond /おみくじ/, (res) ->
    result = res.random ['大吉', '中吉', '小吉', '末吉', '凶', '大凶']
    res.send "今日は「#{result}」です！"
    

