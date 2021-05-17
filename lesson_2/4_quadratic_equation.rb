puts "Введите коээфициенты a, b, c:"
arr = gets.split(",")

a = arr[0].to_f
b = arr[1].to_f
c = arr[2].to_f

dis = b**2 - 4 * a * c

if dis > 0
  dis_sqrt = Math.sqrt(dis)
  
  x1 = (-b + dis_sqrt)/(2 * a)
  x2 = (-b - dis_sqrt)/(2 * a)

  puts "D = #{dis}, x1 = #{x1}, x2 = #{x2}"
elsif dis < 0
  puts "D = #{dis}, корней нет"
else
  x = -b/(2 * a)

  puts "D = #{dis}, x = #{x}"
end 
