
module.exports = (robot) ->
  robot.respond /おみくじ/, (res) ->
    res.send res.random ['大吉', '中吉', '小吉', '末吉', '凶', '大凶']
