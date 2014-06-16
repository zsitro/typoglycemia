module.exports = () ->

  text = arguments[0]
  out = []
  params = arguments[1] or []
  level = params.level or 'soft' # soft|hard
  minChars = params.minChars or 4
  maxChars = params.maxChars or 8

  processWord = (_word) ->
    return _word if _word.length < minChars
    return _word if _word.length > maxChars and level is 'soft'
    _word = _word.split('')
    first = [_word.shift()]
    last = [_word.pop()]

    i = _word.length

    while --i
      j = Math.floor(Math.random() * (i + 1))
      temp = _word[i]
      _word[i] = _word[j]
      _word[j] = temp

    _word.unshift first
    _word.push last
    _word.join ''

  words = text.split(' ')

  for word in words
    out.push processWord word

  out.join ' '