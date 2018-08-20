require_relative 'isbn.rb'
require 'csv'

numbers_arr = []

CSV.foreach("csv/input_isbn_file.csv", ) do |row|
    row.shift
    numbers_arr << row
end

CSV.open("csv/output_isbn_file.csv", "wb") do |csv|
    csv << ["ISBN", "VALIDITY"]
    numbers_arr.shift
    numbers_arr.each do |num|
        validity = funk_master(num[0])
        if validity == true
          validity = " Valid"
        else
           validity = " Invalid"
        end
        csv << [num.join, validity]
    end
end