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
  result = Array.new(amount / 50, 50)
  amount = amount % 50

  result += Array.new(amount / 20, 20)
  amount = amount % 20

  result += Array.new(amount / 5, 5)
  result
end
