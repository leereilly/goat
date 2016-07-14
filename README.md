# Geo-targeted Organic Artisinal Tweets (GOAT)

![Geo-targeted Organic Artisinal tweets](http://imgur.com/i6YusiF.gif)

Twitter now provides an [API](https://dev.twitter.com/ads/campaigns/geo-casting) for creating organic (non-promoted) Tweets with distribution limited to one or more countries.

Let's say that you're promoting a local meetup in Vancouver. If you organize these events frequently and globally, you probably don't want broadcast them to your ~~hundreds~~ ~~thousands~~ millions of Twitter followers *all over the world*. That's a lot of noise that most people won't be interested in.

If you want people in Vancouver to know about your meetup, you can now target the Tweet to peple in Canada :maple_leaf: even if's not a sponsored Tweet as part of some campaign. Here's how...

![Geo-targeted organic tweet to Canada](http://i.imgur.com/kKiUF23.png)

#### Pre-work


Create an application (use a test account) and request to have your application ID whitelisted.<br>

<sup><strong>Note:</strong> Turns out that this isn't easy :( </sup>

#### Installation

You'll need to know a little Ruby-fu to get the ball rolling, but it's as simple as...

```
git clone https://github.com/leereilly/goat
cd goat
bundle install
```

#### Configuration

Add the following environment variables from the Twitter App you just set up (or just override 'em in your code):

```
export CONSUMER_KEY=FOO
export CONSUMER_SECRET=BAR
export ACCESS_TOKEN=LOREM
export ACCESS_SECRET=IPSUM
```

Change the message / locations in `goat.rb` as appropriate.
#### Tweeting

Simply run `ruby goat.rb` to broadcast your message.

Your message now appears on your timeline, and is only viewable to people in that country.

<sup><strong>Note:</strong>  If another account retweets this, it will be seen by all of that account's followers regardless of country. </sup>


##### Disclaimer

This is a barebones [POC](https://en.wikipedia.org/wiki/Proof_of_concept) for a [PHB](https://en.wikipedia.org/wiki/Pointy-haired_Boss). Supporting command line args, or having a web wrapper would be great, but I'm banking on the Twitter gem supporting this and/or Twitter or it's partners making accessing these features easier (and free) in the not-too-distant-future.

 :goat:
