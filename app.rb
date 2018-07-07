require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

post '/' do
  amount = params[:amount].to_i
  if amount <= 0 || amount % 5 > 0
    json({
      status: 400,
      error: 'Invalid amount'
    })
  else
    json({
      status: 200,
      result: witdraw(amount)
    })
  end
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
