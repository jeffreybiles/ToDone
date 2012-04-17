Number::seconds = ->
  @ * 1000

Number::minutes = ->
  @seconds() * 60

Number::minute = Number::minutes

Number::hours = ->
  @minutes() * 60

Number::hour = Number::hours

Number::ago = ->
  new Date(new Date().valueOf() - @)

Number::from_now = ->
  new Date(new Date().valueOf() + @)
#
#console.log 2.seconds()
#console.log new Date()
#console.log 2.seconds().ago()
#console.log 10.seconds().from_now()
#console.log 1.minutes().from_now()
#console.log 1.hours().from_now()
#console.log 1.hour().from_now()
#console.log 1.hour().ago()