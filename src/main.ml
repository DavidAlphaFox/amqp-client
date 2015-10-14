open Async.Std
open Amqp

let log fmt = printf (fmt ^^ "\n%!")

let _ =
  let _ =
    Connection.connect ~host:"127.0.0.1" () >>= fun connection ->
    log "Connection started";
    Connection.open_channel connection 1 >>= fun channel ->
    log "Channel opened";
    Queue.declare channel "Anders" >>= fun _ ->
    log "Test complete";
    return ()
  in
  Scheduler.go ()
