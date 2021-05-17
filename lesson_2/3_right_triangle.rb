puts "Введите длинны сторон треугольника через запятую."
arr = gets.split(",").sort!

a = arr[0].to_i
b = arr[1].to_i
c = arr[2].to_i

if a**2 + b**2 == c**2
  result = "Треугольник прямоугольный"

  result += " и равнобедренный" if a == b
else
  result = "Треугольник не прямоугольный"

  result += " и равносторонний" if a == b && a == c  
end

puts result
