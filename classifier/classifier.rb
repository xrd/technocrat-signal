require 'classifier'
require 'sinatra'
require "sinatra/json"

set :bind, '0.0.0.0'

b = Classifier::Bayes.new 'ruby', 'java'

hello = <<"END"
Hello, java (or ruby)
POST /train/java?code=xxx
POST /classify?code=xxx
END

get '/' do
  hello
end

post '/train/:type' do
  # call b.train_java or b.train_ruby (dynamically)
  b.send "train_#{params['type']}", params['code']
  json status: 'ok'
end

post '/classify' do
  type = b.classify params['code']
  json status: 'ok', type: type
end

