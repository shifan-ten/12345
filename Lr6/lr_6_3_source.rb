def in_block (b)
	res = b.to_f / yield(0.9999999999)
end

def in_lambda (b, func)
	res = b.to_f / func.call(0.9999999999)
end