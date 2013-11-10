<- $
f <- $.ajax(url: \./freq.json data-type: \json).done
$h = $ \#head
$t = $ \#tail
d = []
miss = []
for i from 0 til 26 => miss[i] = 0
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
  chars = d.slice(0, 4).map -> String.fromCharCode(97 + it)
  $h.text chars.shift!
  $t.text chars.join ''
show!
$(document).keydown (e) ->
  k = e.keyCode - 65
  color = \#fff
  if k is not d.0
    color = \#f00
    miss[d.0]++
  $h.css \color, color
.keyup (e) ->
  $h.css \color, \#eee
  k = e.keyCode - 65
  if k is d.0
    d.shift!
    if d.length < 4
      c = next d[d.length - 1]
      for from 0 to miss[c] => d.push c
      miss[c] = 0
    show!

