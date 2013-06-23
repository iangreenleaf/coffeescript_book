# This snippet does not work as expected!
buggySleepSort = (numbers) ->
  for n in numbers
    setTimeout(
      -> console.log n
      n
    )
# sleepSort [4, 2, 6, 9, 3]
# Expected output: 2 3 4 6 9
# Actual output: 3 3 3 3 3

# A working version of SleepSort.
sleepSort = (numbers) ->
  for n in numbers
    do (n) ->
      setTimeout(
        -> console.log n
        n
      )

sleepSort [4, 2, 6, 9, 3]
