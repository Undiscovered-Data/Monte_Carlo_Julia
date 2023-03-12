using Statistics

the_res = 0
for a in 1:1000
	the_num = 0
	for b in 1:10
		truefalse = rand()
		if truefalse < 0.93
			the_num += 1
		end
	end
	if the_num == 10
		global the_res += 1
	end
end
println(the_res)

