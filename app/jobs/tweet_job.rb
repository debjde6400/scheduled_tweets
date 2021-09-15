class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    # Rescheduled a tweet to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end

# push publish_at forward
# noon -> 8AM
# 8AM -> sets tweet id
# Noon -> published, does nothing

# push publish_at future
# 9AM -> 1PM
# 9AM -> should do nothing
# 1PM -> should publish tweet and set tweet_id