require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @number = params.fetch("number")
  if @number.include? "."
    @number = @number.to_f
  else
    @number = @number.to_i
  end
  @square = @number **2

  erb(:square_result)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @number = params.fetch("number")
  if @number.include? "."
    @number = @number.to_f
  else
    @number = @number.to_i
  end
  @square_root = Math.sqrt(@number)

  erb(:square_root_result)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_i
  @pv = params.fetch("pv").to_f

  r = (@apr / 100) / 12
  n = @years * 12

  numerator = r * @pv 
  denominator = 1 - (1 + r)**(-n)
  @payment = numerator / denominator

  @apr = @apr.to_fs(:percentage, {:precision => 4})
  @pv = @pv.to_fs(:currency)
  @payment = @payment.to_fs(:currency)
  erb(:payment_result)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @rand_num = rand(@min..@max)

  erb(:random_result)
end
