class Userstream
  module Connect
    class User
      
      class Oauth
        attr_reader :name, :access_token, :access_secret
        def initialize(access_token, access_secret, name = nil)
          @name = name
          @access_token = access_token
          @access_secret = access_secret
        end
        
        def oauth?
          true
        end
      end

      def self.oauth(access_token, access_secret, name = nil)
        Oauth.new(access_token, access_secret, name)
      end
    end

    def get_connection(user, url, method, extras = nil)
      options = extras ? extras.merge(:timeout => 0) : {:timeout => 0}
      if user.oauth?
        request = EM::HttpRequest.new(url)
        request.send(method, options) do |client|
          twitter_oauth_consumer.sign!(client, twitter_oauth_access_token(user.access_token, user.access_secret))
        end
      else
        http = EM::HttpRequest.new(url).send(method, options.merge(:head => {'authorization' => [user.name, user.password]}))
      end
      
    end

    def twitter_oauth_consumer
      OAuth::Consumer.new(consumer_token, consumer_secret, :site => "http://twitter.com")
    end

    def twitter_oauth_access_token(token=nil,secret=nil)
      OAuth::AccessToken.new(twitter_oauth_consumer, token, secret)
    end
  end
end