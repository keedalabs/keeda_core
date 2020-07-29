import CableReady from 'cable_ready'
import consumer from "./consumer"

consumer.subscriptions.create("ActivityChannel", {
  received(data) {
    if(data.cableReady) CableReady.perform(data.operations)
    // Called when there's incoming data on the websocket for this channel
  }
});
