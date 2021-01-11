require_relative "lr_6_3_source.rb"

print "Введите размер экрана: "
b = gets.chomp()
print "Метод: 1-блоком, 2-лямбда: "

case gets.chomp
when "1"
	print ('Введите 1 - для sin(x) * x при |x| < 1 или  2 - tg(x) |x| < 1: ')
	case gets.chomp
	when "1"
		in_block(b) do |x|
			p Math.sin(x)*x
		end
	when "2"
		in_block(b) do |x|
			p Math.tan(x)
		end
	end

when "2"
	print ('Введите 1 - для sin(x) * x при |x| < 1 или  2 - tg(x) |x| < 1: ')
	case gets.chomp
	when "1"
		p in_block(b, &->(x) { Math.sin(x)*x })
	when "2"
		p in_block(b, &->(x) { Math.tan(x) } )
	end
end