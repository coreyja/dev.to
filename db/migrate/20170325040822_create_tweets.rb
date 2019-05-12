class CreateTweets < ActiveRecord::Migration
  def change
    create_table(:tweets) do |t|
      t.integer(:user_id)
      t.integer(:favorite_count)
      t.integer(:retweet_count)
      t.integer(:twitter_user_following_count)
      t.integer(:twitter_user_followers_count)
      t.string(:in_reply_to_user_id_code)
      t.string(:in_reply_to_status_id_code)
      t.string(:twitter_uid)
      t.string(:twitter_username)
      t.string(:twitter_id_code)
      t.string(:quoted_tweet_id_code)
      t.string(:in_reply_to_username)
      t.string(:source)
      t.string(:text)
      t.string(:twitter_name)
      t.string(:mentioned_usernames_serialized, default: [].to_yaml)
      t.string(:hashtags_serialized, default: [].to_yaml)
      t.string(:primary_external_url)
      t.string(:profile_image)
      t.text(:urls_serialized, default: [].to_yaml)
      t.text(:media_serialized, default: [].to_yaml)
      t.text(:extended_entities_serialized, default: {}.to_yaml)
      t.text(:full_fetched_object_serialized, default: {}.to_yaml)
      t.datetime(:tweeted_at)
      t.datetime(:last_fetched_at)
      t.boolean(:user_is_verified)
      t.boolean(:is_quote_status)
      t.timestamps(null: false)
    end
  end
end
