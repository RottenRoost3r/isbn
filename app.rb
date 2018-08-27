require 'sinatra'
require 'csv'
require 'aws-sdk-s3'
require 'json'
require_relative 'isbn.rb'
# require_relative 'csv.rb'

enable :sessions

load 'local_ENV.rb' if File.exist?('local_ENV.rb')

s3 = Aws::S3::Client.new(profile: 'rottenrooster', region: 'us-east-2')

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

  valid = CSV.generate do |csv|
    val_arr.each_with_index do |v,i|
      csv << [line_arr[i], v]
    end
  end

  session[:result] = val_arr
  session[:isbn_name] = line_arr
  p "result is #{val_arr}"
  p "name is #{line_arr}"

  s3.put_object(bucket:'j823bucket', body: valid, key:"output_isbn_file.csv")

  redirect "/"
end
