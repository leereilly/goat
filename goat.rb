require 'rubygems'
require 'dotenv'
require 'oauth'
require 'uri'

# Set these values in your environment or just override them here. Sign up for
# keys and access tokens via https://apps.twitter.com/app (use a test account).
CONSUMER_KEY    = ENV['CONSUMER_KEY']
CONSUMER_SECRET = ENV['CONSUMER_SECRET']
ACCESS_TOKEN    = ENV['ACCESS_TOKEN']
ACCESS_SECRET   = ENV['ACCESS_SECRET']

# What are you tweeting?
message  = "GitHub Meetup in Vancouver this Friday! https://github.com/blog/1142-vancouver-meetup"

# Which country do want this tweet to be seen in? Example below is the ID for
# Canada.
location = "3376992a082d67c7"

def prepare_access_token(oauth_token, oauth_token_secret)
  consumer     = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { :site => "https://api.twitter.com", :scheme => :header })
  token_hash   = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

  return access_token
end

access_token = prepare_access_token(ACCESS_TOKEN, ACCESS_SECRET)

response = access_token.request(:post, "https://api.twitter.com/1.1/statuses/update.json?status=#{message.gsub(' ', '+')}?narrowcast_place_ids=#{location}")

if response.code == '200'
  puts "Tweeted successfully!"
else
  puts "Whoah, Nelly!\n#{response.message}"
end
