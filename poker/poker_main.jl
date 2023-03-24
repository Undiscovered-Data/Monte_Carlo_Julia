include("./poker_fn1.jl")
using .the_poker

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


println("Enter D to have hand dealt or P to pick")
the_choice = chomp(readline())
if the_choice == "D"
    my_hand = the_poker.deal(the_cards)
elseif the_choice == "P"
    my_hand = the_poker.pick_hand(the_cards)
end

hand_is_straight = the_poker.is_straight(my_hand, the_number)
hand_is_flush = the_poker.is_flush(my_hand)

hand_score = 0
if hand_is_straight && hand_is_flush
    println("You have a straight flush")
    hand_score = 8
elseif hand_is_straight
    println("You have a straight")
    hand_score = 4
elseif hand_is_flush
    println("You have a flush")
    hand_score = 5
else
    hand_type = the_poker.kind_of(my_hand, the_number)
    hand_score = the_poker.assign_score(hand_type)
    println("You have $hand_score")
end

println(my_hand)
println("Enter the cards you want to discard")
the_discard = chomp(readline())
discard_hand = split(the_discard)
for card2 in discard_hand
    filter!(!=(card2), my_hand)
end

discarded_number = length(discard_hand)
count_upgrade = 0
for a in 1:10
    new_my_hand = copy(my_hand)
    new_cards = copy(the_cards)
    for b in 1:discarded_number
        deck3_length = length(new_cards)
        my_rand3 = rand(1:deck3_length)
        #println(my_rand3)
        draw_card = new_cards[my_rand3]
        push!(new_my_hand, draw_card)
        deleteat!(new_cards, my_rand3)
    end
    println(new_my_hand)

    new_hand_is_straight = the_poker.is_straight(new_my_hand, the_number)
    new_hand_is_flush = the_poker.is_flush(new_my_hand)
    new_hand_score = 0

    if new_hand_is_straight && new_hand_is_flush
        new_hand_score = 8
    elseif new_hand_is_straight
        new_hand_score = 4
    elseif new_hand_is_flush
        new_hand_score = 5
    else
        new_hand_type = the_poker.kind_of(new_my_hand, the_number)
        new_hand_score = the_poker.assign_score(new_hand_type)
    end
    if new_hand_score > hand_score
        global count_upgrade += 1
    end
    #println(count_upgrade)
end
println(count_upgrade)
