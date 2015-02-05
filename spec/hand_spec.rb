require "spec_helper"

describe(Hand) do
  describe("#put_cards_in_hand") do
    it 'receives 6 cards and places them into a hand' do
      test_player = Player.create({:name => "Dennis", :current_score => 0, :player_number => 1})
      test_deck = Deck.fresh_deck({:shuffled => false})
      test_hand = Hand.create({:winner => nil, :final_score => nil, :zero_zero_card => nil, :zero_one_card => nil, :one_zero_card => nil, :one_one_card => nil, :two_zero_card => nil, :two_one_card => nil})
      test_player.hands << test_hand
      compare_card = Card.create({:value => 0, :suit => 0, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      test_hand.put_cards_in_hand(test_deck.draw(6))
      expect(Card.find(test_hand.zero_zero_card)).to(eq(compare_card))
    end
  end

  describe("switch_card") do
    it 'switchs a card in the players field to the discard pile' do
      test_player = Player.create({:name => "Dennis", :current_score => 0, :player_number => 1})
      test_deck = Deck.fresh_deck({:shuffled => false})
      test_hand = Hand.create({:winner => nil, :final_score => nil, :zero_zero_card => nil, :zero_one_card => nil, :one_zero_card => nil, :one_one_card => nil, :two_zero_card => nil, :two_one_card => nil})
      test_player.hands << test_hand
      test_hand.put_cards_in_hand(test_deck.draw(6))
      switch_card = Card.create({:value => 13, :suit => 3, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      test_hand.switch(5, switch_card)
      expect(Card.find(test_hand.two_one_card)).to(eq(switch_card))
    end
  end
end
