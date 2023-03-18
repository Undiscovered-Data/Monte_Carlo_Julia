

the_cards = [
"A_S", "A_H", "A_D", "A_C",
"K_S", "K_H", "K_D", "K_C",
"Q_S", "Q_H", "Q_D", "Q_C",
"J_S", "J_H", "J_D", "J_C",
"10S", "10H", "10D", "10C",
"9_S", "9_H", "9_D", "9_C", 
"8_S", "8_H", "8_D", "8_C",
"7_S", "7_H", "7_D", "7_C",
"6_S", "6_H", "6_D", "6_C",
"5_S", "5_H", "5_D", "5_C",
"4_S", "4_H", "4_D", "4_C",
"3_S", "3_H", "3_D", "3_C",
"2_S", "2_H", "2_D", "2_C"
]

the_number = Dict('A' => 14, 'K' => 13, 'Q' => 12, 'J' => 11, '1' => 10,
                '9' => 9, '8' => 8, '7' => 7, '6' => 6, '5' => 5, '4' => 4,
                '3' => 3, '2' => 2)


function deal(the_cards)
    the_hand = String[]
    for a in 1:5
        deck_length = length(the_cards)
        the_spot = rand(1:deck_length)
        a_card = the_cards[the_spot]
        push!(the_hand, a_card)
        deleteat!(the_cards, the_spot)
    end
    return the_hand
end

my_hand = deal(the_cards)

function is_straight(my_hand, the_number)
    #my_hand = deal(the_cards)
    un_sort_num = Int[]
    for b_card in my_hand
        front = b_card[1]
        ins_num = the_number[front]
        push!(un_sort_num, ins_num)
    end
    sort_num = sort(un_sort_num)

    low_num = sort_num[1]
    is_true = true
    for the_number in sort_num
        if low_num != the_number
            is_true = false
            break
        end
        low_num += 1
    end
    return (sort_num, is_true)
end

sorted_list = is_straight(my_hand, the_number)
println(sorted_list)

function is_flush(my_hand)
    the_suits = Char[]
    for c_card in my_hand
        back = c_card[3]
        push!(the_suits, back)
    end

    suit_value = the_suits[1]
    the_same = true
    for which_suit in the_suits
        if suit_value != which_suit
            the_same = false
            break
        end
    end
    return (the_suits, the_same)
end

check_flush = is_flush(my_hand)
println(check_flush)

function kind_of(my_hand)
    value_array = zeros(Int8, 13)

    card_array = ["ace", "king", "queen", "jack", "ten", "nine", "eight",
     "seven", "six", "five", "four", "three", "two"]

    for d_card in my_hand
        the_front = d_card[1]
        pre_value = the_number[the_front]
        n_value = pre_value - 1
        value_array[n_value] += 1
    end
    r_array = reverse(value_array)
    card_quant = Any[]
    arr_count = 0
    for the_val in r_array
        arr_count += 1
        card_q = the_val
        card_name = card_array[arr_count]
        if card_q == 0
            continue
        end
        push!(card_quant, (card_q, card_name))
    end
    sr_card_quant = sort(card_quant, rev=true)
        
    return (sr_card_quant)
end

check_kinds = kind_of(my_hand)
println(check_kinds)

function assign_score(check_kinds)
    two = 0
    three = 0
    four = 0
    for f_item in check_kinds
        rel_numb = f_item[1]
        if  rel_numb == 2
            two += 1
        elseif rel_numb == 3
            three += 1
        elseif rel_numb == 4
            four += 1
        end
    end
    if three == 1 && two == 1
        the_res, score = "full house", 6
    elseif two == 1
        the_res, score = "a pair", 1
    elseif two == 2
        the_res, score = "two pair", 2
    elseif three == 1
        the_res, score = "three kind", 3
    elseif four == 1
        the_res, score = "four kind", 7
    else
        the_res, score = "high card", 0
    end
    return (the_res, score)
end
    
final_res = assign_score(check_kinds)
println(final_res)

