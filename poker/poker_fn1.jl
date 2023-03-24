
module the_poker
#*****************************************************#
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
#*****************************************************#
    function is_straight(my_hand, the_number)
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
        return is_true
    end
#*****************************************************#
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
        return the_same
    end
#*****************************************************#
    function kind_of(my_hand, the_number)
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
            
        return sr_card_quant
    end
#*****************************************************#
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
            score =  6
        elseif two == 1
            score =  1
        elseif two == 2
            score =  2
        elseif three == 1
            score =  3
        elseif four == 1
            score =  7
        else
            score =  0
        end
        return score
    end
#*****************************************************#
    function pick_hand(the_cards)
        println("Enter the hand separated by space")
        in_line = chomp(readline())
        in_hand = split(in_line)
        for card in in_hand
            filter!(!=(card), the_cards)
        end
        return in_hand

    end
end
