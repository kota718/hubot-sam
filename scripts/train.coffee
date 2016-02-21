Cheerio = require 'cheerio-httpcli'
Cron = require('cron').CronJob

module.exports = (robot) ->
  new Cron(
    cronTime: '00 00 08 * * *'
    onTick: ->
      doInfomation(robot)
      return
    start: true
    timeZone: "Asia/Tokyo"
  )

doInfomation = (robot) ->
  baseUrl = 'http://transit.loco.yahoo.co.jp/traininfo/gc/13/'

  Cheerio.fetch baseUrl, (err, $, res) ->
    if $('.elmTblLstLine.trouble').find('a').length == 0
      robot.send "事故や遅延情報はありません"
      return
    $('.elmTblLstLine.trouble a').each ->
      url = $(this).attr('href')
      Cheerio.fetch url, (err, $, res) ->
        title = "◎ #{$('h1').text()} #{$('.subText').text()}"
        result = ""
        $('.trouble').each ->
          trouble = $(this).text().trim()
          result += "- " + trouble + "\r\n"
        robot.send {room: 'general'}, "#{title}\r\n#{result}"
