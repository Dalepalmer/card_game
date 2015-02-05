require "spec_helper"

describe(Card) do
  it {should belong_to(:deck)}

  describe('#discard') do
    it 'discards a card from a players hand' do
      test_deck = Deck.fresh_deck({:shuffled => true})
      test_card1 = Card.create({:value => 0, :suit => 0, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 1})
      test_card2 = Card.create({:value => 0, :suit => 1, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 1})
      test_card3 = Card.create({:value => 0, :suit => 2, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 1})
      test_card4 = Card.create({:value => 0, :suit => 3, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 1})
      test_card3.discard
      expect(test_card3.hand_id()).to eq(10)
    end
  end
end
