module Blackjack
  def self.parse_card(card)
    case card
    when "ace"
      11
    when "two"
      2
    when "three"
      3
    when "four"
      4
    when "five"
      5
    when "six"
      6
    when "seven"
      7
    when "eight"
      8
    when "nine"
      9
    when "ten", "jack", "queen", "king"
      10
    else
      0
    end
  end

  def self.card_range(card1, card2)
    card1_value = parse_card(card1)
    card2_value = parse_card(card2)
    total = card1_value + card2_value
    case
    when (4..11).cover?(total)
      "low"
    when (12..16).cover?(total)
      "mid"
    when (17..20).cover?(total)
      "high"
    when total == 21
      "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    
    player_total = parse_card(card1) + parse_card(card2)
    dealer_value = parse_card(dealer_card)

    case
      # 1) Pair of aces → split
    when card1 == "ace" && card2 == "ace"
      "P"

      # 2) Blackjack (21)
    when player_total == 21
      ["ace", "ten", "jack", "queen", "king"].include?(dealer_card) ? "S" : "W"

      # 3) 17–20 → stand
    when (17..20).cover?(player_total)
      "S"

      # 4) 12–16 → stand unless dealer has 7+
    when (12..16).cover?(player_total)
      dealer_value >= 7 ? "H" : "S"

      # 5) 11 or lower → hit
    else
      "H"
    end
  end
end
