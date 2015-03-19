require 'trello'

#Trello.configure do |config|
  #config.developer_public_key = '5c69b1b1c97c366b9ac25e11268a5e17'
  #config.member_token = 'd8795b476ddaff84c9ee101de2d0cceea8123c328ab9c4b70e8eefab06f4d009'
#end
Trello.configure do |config|
  config.consumer_key    = '5c69b1b1c97c366b9ac25e11268a5e17'
  config.consumer_secret = '5a656aaa9e56455886cf825f85efe8c6299d97993ec69b574390877b2974988a'
  config.return_url      = 'http://10.11.11.11:3000/'
  config.callback        = lambda { |request_token|
    # session[:oauth_token] = request_token.oauth_token
    # session[:oauth_token_secret] = request_token.oauth_token_secret
    # redirect_to request_token.authorize_url
  }
end
#
#ENV['CONSUMER_KEY'] = '5c69b1b1c97c366b9ac25e11268a5e17'
#ENV['CONSUMER_SECRET'] = '5a656aaa9e56455886cf825f85efe8c6299d97993ec69b574390877b2974988a'
#ENV['APP_NAME'] = 'xyzApp'
