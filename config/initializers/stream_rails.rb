
require 'stream_rails'

StreamRails.configure do |config|
  config.api_key      = "ed97ces2ru44"
  config.api_secret   = "dkdd2xh9ah4ezk2m3x7g7n59xq85wmvp367vgvgcunzad8fyndmdrw4sppux6ppt"
  config.timeout      = 30                  # Optional, defaults to 3
  config.location     = 'us-east'           # Optional, defaults to 'us-east'
  config.api_hostname = 'stream-io-api.com' # Optional, defaults to 'stream-io-api.com'
  # If you use custom feed names, e.g.: timeline_flat, timeline_aggregated,
  # use this, otherwise omit:
  config.news_feeds = { flat: "timeline" }
  # Point to the notifications feed group providing the name, omit if you don't
  # have a notifications feed
  config.notification_feed = "notification"
end