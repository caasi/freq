<- $
f <- $.ajax(url: \./freq.json data-type: \json).done
$h = $ \#head
$t = $ \#tail
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
  chars = d.map -> String.fromCharCode(97 + it)
  $h.text chars.shift!
  $t.text chars.join ''
show!
$(document).keydown (e) ->
  k = e.keyCode - 65
  $h.css \color, if k is d.0 then \#fff else \#f00
  console.log k is d.0
.keyup (e) ->
  $h.css \color, \#eee
  k = e.keyCode - 65
  if k is d.0
    d.shift!
    d.push next d[d.length - 1]
    show!

