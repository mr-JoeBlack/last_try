puts "Добрый день. Как ваше имя?"
name =  gets.chomp
puts "Каков ваш рост в сантиметрах?"
perfect_weihgt = gets.chomp.to_i - 110

if perfect_weihgt > 0
  puts "#{name}, Ваш идеальный вес #{perfect_weihgt} кг."
else
  puts "#{name}, Ваш вес уже оптимальный."
end
