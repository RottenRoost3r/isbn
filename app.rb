require 'sinatra'
require_relative 'isbn.rb'
require 'csv'
enable :sessions

get '/' do
  result = session[:result] || []
  isbn_name = session[:isbn_name] || []
  erb :isbn, locals:{result: result, isbn_name: isbn_name}
end

post'/isbn' do 
  num = params[:garb].split("\r\n") || []
  line_arr = []
  val_arr = []
  num.each do |n|
    val_arr << funk_master(n)
    line_arr << n
  end

  session[:result] = val_arr
  session[:isbn_name] = line_arr
  p "result is #{val_arr}"
  p "name is #{line_arr}"
  redirect "/"
end
