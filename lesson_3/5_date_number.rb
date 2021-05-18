month_array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Введите число, месяц, год через запятую."
date_arr = gets.split(",")

day = date_arr[0].to_i
month = date_arr[1].to_i
year = date_arr[2].to_i

month_array[1] = 29 if year % 400 == 0 || ( year % 4 == 0 && year % 100 != 0)  

puts "Порядковый номер даты: #{ day + month_array.take(month-1).sum }" 
