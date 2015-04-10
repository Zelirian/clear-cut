{specificity} = require '../lib/main'

count = 0

calculate = (selector) ->
  count++
  specificity(selector)
  return

start = Date.now()

benchmark = (number) ->
  for letter in 'abcdefghijklmnopqrztuvwxyz0123456789'
    calculate("a-custom-tag-#{letter}")
    calculate("a-custom-tag-#{letter}-#{number}")

    calculate("a-custom-tag-#{letter}.a-class")
    calculate("a-custom-tag-#{letter}#an-id")

    calculate("body, a-custom-tag-#{letter}")
    calculate("body, a-custom-tag-#{letter}-#{number}")

    calculate("body, a-custom-tag-#{letter}.a-class")
    calculate("body, a-custom-tag-#{letter}#an-id")

    calculate("body > a-custom-tag-#{letter}")
    calculate("body > a-custom-tag-#{letter}-#{number}")

    calculate("body > a-custom-tag-#{letter}.a-class")
    calculate("body > a-custom-tag-#{letter}#an-id")

    calculate(".a-custom-class-#{letter}")
    calculate(".a-custom-class-#{letter}-#{number}")

    calculate(".a-custom-class-#{letter}.a-class")
    calculate(".a-custom-class-#{letter}#an-id")

    calculate(".a-class > .a-custom-class-#{letter}")
    calculate(".a-class > .a-custom-class-#{letter}.a-class")
    calculate(".a-class > .a-custom-class-#{letter}#an-id")

    calculate(".a-class, .a-custom-class-#{letter}")
    calculate(".a-class, .a-custom-class-#{letter}.a-class")
    calculate(".a-class, .a-custom-class-#{letter}#an-id")

    calculate("#a-custom-id-#{letter}")
    calculate("#a-custom-id-#{letter}.a-class")

    calculate("#an-id > #a-custom-id-#{letter}")
    calculate("#an-id > #a-custom-id-#{letter}.a-class")

    calculate("#an-id, #a-custom-id-#{letter}")
    calculate("#an-id, #a-custom-id-#{letter}.a-class")
  return

benchmark(index) for index in [0..10]

console.log "Calculated #{count} selector specificities in #{Date.now() - start}ms"
