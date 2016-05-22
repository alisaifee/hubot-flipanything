# Description:
#   Make hubot flip a table
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot flip - Hubot flips a table
#   hubot flip <some thing> - Hubot flips said thing
#
# Author:
#   jjasghar
#   Jason Dixon
#   Ali-Akber Saifee

module.exports = (robot) ->
  CHAR_MAP = {
    "a": "ɐ",
    "b": "q",
    "c": "ɔ",
    "d": "p",
    "e": "ǝ",
    "f": "ɟ",
    "g": "ƃ",
    "h": "ɥ",
    "i": "ᴉ",
    "j": "ɾ",
    "k": "ʞ",
    "l": "l",
    "m": "ɯ",
    "n": "u",
    "o": "o",
    "p": "d",
    "q": "b",
    "r": "ɹ",
    "s": "s",
    "t": "ʇ",
    "u": "n",
    "v": "ʌ",
    "w": "ʍ",
    "x": "x",
    "y": "ʎ",
    "z": "z",
    "A": "∀",
    "B": "B",
    "C": "Ɔ",
    "D": "D",
    "E": "Ǝ",
    "F": "Ⅎ",
    "G": "פ",
    "H": "H",
    "I": "I",
    "J": "ſ",
    "K": "K",
    "L": "˥",
    "M": "W",
    "N": "N",
    "O": "O",
    "P": "Ԁ",
    "Q": "Q",
    "R": "R",
    "S": "S",
    "T": "┴",
    "U": "∩",
    "V": "Λ",
    "W": "M",
    "X": "X",
    "Y": "⅄",
    "Z": "Z",
    "0": "0",
    "1": "Ɩ",
    "2": "ᄅ",
    "3": "Ɛ",
    "4": "ㄣ",
    "5": "ϛ",
    "6": "9",
    "7": "ㄥ",
    "8": "8",
    "9": "6",
    ".": "˙",
    "?": "¿",
    "!": "¡",
    "'": ",",
    "`": ",",
    ")": "",
    "[": "]",
    "]": "[",
    "{": "}",
    "}": "{",
    "<": ">",
    ">": "<",
    "&": "⅋",
    "_": "‾"
  }
  for k,v of CHAR_MAP
    CHAR_MAP[v]=k
  reversed = (sentence) ->
    return ((if CHAR_MAP[item] then CHAR_MAP[item] else item) for item in sentence.split('').reverse()).join('')

  robot.respond /flip\b(.*)/i, (msg) ->
    table = '┻━┻'
    flips = [
      '(╯°□°）╯︵ [table]',
      '[table] ノ( ゜-゜ノ)',
      '(ノ ゜Д゜)ノ ︵ [table]',
      '(╯°□°)╯︵ [table] ︵ ╯(°□° ╯)',
      '[table] ︵ /(.□. \）',
      '‎(ﾉಥ益ಥ）ﾉ [table]',
      '(ノ^_^)ノ[table] ┬─┬ ノ( ^_^ノ)',
      "(╯'□')╯︵ [table]",
      '(ﾉಥДಥ)ﾉ︵[table]･/',
      '(/ .□.)\ ︵╰(゜Д゜)╯︵ /(.□. \)',
      '(._.) ~ ︵ [table]',
      'ʕノ•ᴥ•ʔノ ︵ [table]',
      '(/¯◡ ‿ ◡)/¯ ~ [table]',
      '(/¯◡ ‿ ◡)/¯ ~ [table]',
      '[table] ︵ ლ(⌒-⌒ლ)',
    ]
    thing = msg.match[1].replace /^\s+|\s+$/g, ""
    flipper = msg.random flips
    if !thing or thing == 'table'
      msg.send flipper.replace(/\[table\]/, table)
    else
      msg.send flipper.replace(/\[table\]/, reversed(thing))

