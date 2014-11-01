# Description:
#   A hubot script get url of book image from Amazon.
#
# Commands:
#   hubot bookimg me <asin> - Return the image of the book corresponding to <asin (isbn10 or isbn13) >.
#
# Author:
#   asmz

module.exports = (robot) ->

  robot.respond /(?:(middle|small|thumb)[- ])?bookimg me (.+)/i, (msg) ->
    size   = msg.match[1] ? "large"
    param  = msg.match[2]

    if param.length is 10
      asin = param
    else if param.length is 13
      asin = convertIsbn13ToIsbn10 param
    else if param.length is 14 && param[3] is "-"
      asin = convertIsbn13ToIsbn10 param[0..2] + param[4..12]
    else
      return

    url = getBookImageUrl asin, size
    msg.send url

convertIsbn13ToIsbn10 = (isbn13) ->
  isbn10 = isbn13[3..11].toString()
  digit = 0

  for val, i in isbn10
    digit += isbn10[i] * (10 - i)
  
  digit = 11 - (digit % 11)
  if digit is 10
    digit = "X"
  else if digit is 11
    digit = "0"
  else
    digit = digit.toString()

  isbn10 = isbn10 + digit

getBookImageUrl = (asin, size) ->
  switch size
    when "middle" then imgparam = "MZZZZZZZ"
    when "small"  then imgparam = "TZZZZZZZ"
    when "thumb"  then imgparam = "THUMBZZZ"
    else imgparam = "LZZZZZZZ"

  url = "http://images-jp.amazon.com/images/P/" +
        asin +
        ".09." +
        imgparam +
        ".jpg"
