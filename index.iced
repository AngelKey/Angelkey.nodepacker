assert = require 'assert'
{pack,unpack} = require 'purepack'

#==================================================================

bufferify = (o) ->
  typ = typeof(o)
  switch typ
    when 'string'
      if (o.length % 2 is 0) and o.match /^[A-Fa-f0-9]+$/
        new Buffer o, 'hex'
      else
        o
    when 'object'
      if Array.isArray(o) then (bufferify(e) for e in o)
      else if (o is null) then null
      else
        d2 = {}
        for k,v of o
          d2[k] = bufferify(v)
        d2
    else
      o

#==================================================================

unbufferify = (o) ->
  if typeof(o) isnt 'object' then o
  else if Array.isArray(o) then (unbufferify(e) for e in o)
  else if (o is null) then null
  else if Buffer.isBuffer(o) then o.toString('hex')
  else
    d2 = {}
    for k,v of o
      d2[k] = unbufferify(v)
    d2

#==================================================================

compress = (o) -> pack bufferify o
uncompress = (o) -> unbufferify unpack o

#==================================================================

module.exports = { bufferify, unbufferify, compress, uncompress }

#==================================================================

