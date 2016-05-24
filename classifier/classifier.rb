require 'classifier'
require 'sinatra'
require "sinatra/json"

set :bind, '0.0.0.0'

b = Classifier::Bayes.new 'ruby', 'java'
puts "Training in process"
# Train things up
b.train_ruby File.read( 'training/factorial.rb' )
b.train_java File.read( 'training/factorial.java' )
puts "Training done"

hello = <<"END"
Hello, java (or ruby)
POST /train/java?code=xxx
POST /classify?code=xxx
END

get '/' do
  hello
end

post '/train/:type' do
  puts "Params: #{params['code']} / #{params['type']}"
  # call b.train_java or b.train_ruby (dynamically)
  b.send "train_#{params['type']}", params['code']
  json status: 'ok'
end

post '/classify' do
  puts "Params: #{params['code']}"
  type = b.classify params['code']
  json status: 'ok', type: type
end

