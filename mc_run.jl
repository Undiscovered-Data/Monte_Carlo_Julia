using Statistics

println("Welcome to MC")
all_items = String[]
unique_items = String[]

while true
    println("To calculate type calc or enter to input items")
	a_break = readline()
	if a_break == "calc"
		break
	end

	print("Type name of item: ")
	item = readline()
    push!(unique_items, item)

	print("Type the number of it: ")
	s_count = readline()
	item_count = parse(Int32, s_count)

	for a in 1:item_count
		push!(all_items, item)
	end
end

for b in unique_items
    num_list = Int[]
    for c in 1:1000
        items_copy = copy(all_items)
        the_count = 0
        while length(items_copy) > 0
            the_count += 1
            the_length = length(items_copy)
            the_n = rand(1: the_length)
            pp = items_copy[the_n]
            if pp == b
                break
            end
            deleteat!(items_copy, the_n)
        end

        push!(num_list, the_count)
    end
    the_mean = mean(num_list)
    the_std = std(num_list)
    println("\n************************************\n")
    println("The mean of $b is $the_mean")
    println("The std of $b is $the_std\n")
end
println("\n************************************\n")

