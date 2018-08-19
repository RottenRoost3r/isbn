require 'sinatra'
require_relative 'isbn.rb'
require 'csv'
enable :sessions

get '/' do
  result = session[:result] || ""
  isbn_name = session[:isbn_name] || ""
  erb :isbn, locals:{result: result, isbn_name: isbn_name}
end

post'/isbn' do 
  num = params[:garb]
  session[:result] = funk_master(num)
  session[:isbn_name] = num
  display = num.split("\r\n")
  line_arr = []
  val_arr = []
  # CSV.foreach("ISBN/csv/input_isbn_file.csv") do |row|
  #   funk_master(row) 
  # end
  display.each do |n|
    if funk_master(n)
      val_arr << "Valid"
    else
      val_arr << "Invalid"
    end
    if n != nil
      line_arr << "#{n}"
    else
      line_arr << ""
    end
  end
  dooper = CSV.generate do |csv|
    val_arr.each_with_index do |n,i|
      csv << [line_arr[i], n]
    end
  end

  session[:isbn_name] = line_arr
  session[:result] = val_arr
  redirect "/"
end
