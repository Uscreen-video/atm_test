require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  json witdraw(params[:amount].to_i)
end

def witdraw(amount)
  result = []
  while amount / 50 > 0
    result << 50
    amount -= 50
  end
  while amount / 20 > 0
    result << 20
    amount -= 20
  end
  while amount / 5 > 0
    result << 5
    amount -= 5
  end
  result
end
