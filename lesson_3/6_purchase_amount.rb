purchase = {}

loop do
  puts "Введите название товара (для остановки введите \"stop\":)"
  name = gets.chomp
  
  break if name == "stop"
  
  puts "Введите цену:"
  price = gets.to_f

  puts "Введите количество:"
  quantity = gets.to_f
  
  purchase[name] = {price: price, quantity: quantity}
end

puts purchase

amount = 0

purchase.each do |name, item|
  one_amount = item[:price] * item[:quantity]
  
  puts "Стоимость товара \"#{name}\" - #{one_amount}"

  amount += one_amount
end  

puts "Общая сумма покупок: #{amount}"
