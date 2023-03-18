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

my_hand = the_poker.deal(the_cards)
println(my_hand)

hand_is_straight = the_poker.is_straight(my_hand, the_number)
println(hand_is_straight)

hand_is_flush = the_poker.is_flush(my_hand)
println(hand_is_flush)

hand_type = the_poker.kind_of(my_hand, the_number)
println(hand_type)

promo_score = the_poker.assign_score(hand_type)
println(promo_score)

