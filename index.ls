<- $
f <- $.ajax(url: \./freq.json data-type: \json).done
$d = $ \#display
d = []
prepare = ->
  r = []
  s = it.reduce (p, c) -> r.push p; p + c
  r.map -> it / s
f = f.map prepare
next = ->
  r = Math.random!
  for k, v of f[it]
    return parseInt k, 10 if r < v
  return 25
d.push ~~(Math.random! * 26)
for from 1 to 3
  d.push next d[d.length - 1]
show = ->
  $d.text d.map(-> String.fromCharCode(65 + it).toLowerCase!).join ''
show!
$(document).keyup (e) ->
  k = e.keyCode - 65
  if k is d.0
    d.shift!
    d.push next d[d.length - 1]
    show!

