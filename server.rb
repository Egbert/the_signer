"rubygems
bundler/setup
sinatra/base
slim
./the_signer
".lines.map(&:strip).each &method(:require)

class Server < Sinatra::Base
  get '/' do
    @assignment = TheSigner::Assignment.new
    slim :index
  end
end

