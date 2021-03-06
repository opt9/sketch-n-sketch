module ImpureGoodies exposing (..)

import Native.ImpureGoodies


randomFloat : () -> Float
randomFloat () =
  Native.ImpureGoodies.randomFloat ()


randomInt : Int -> Int -> Int
randomInt low highNonInclusive =
  let range = highNonInclusive - low in
  randomFloat () * toFloat range + toFloat low |> floor


-- Runs thunk. If thunk crashes, log the error to the console and return Nothing.
crashToNothing : (() -> a) -> Maybe a
crashToNothing thunk =
  Native.ImpureGoodies.crashToNothing thunk


-- Runs thunk. If thunk crashes, returns an Err value. No built-in logging.
crashToError : (() -> a) -> Result String a
crashToError thunk =
  Native.ImpureGoodies.crashToError thunk


timedRun : (() -> a) -> (a, Float)
timedRun thunk =
  Native.ImpureGoodies.timedRun thunk


logTimedRun : String -> (() -> a) -> a
logTimedRun caption thunk =
  let (result, time) = timedRun thunk in
  let _ = Debug.log (caption ++ " milliseconds") time in
  result
