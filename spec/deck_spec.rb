require "spec_helper"

describe(Deck) do
  it {should have_many(:cards)}
  it {should belong_to(:game)}


  describe('#draw') do
    it 'draws from a new unshuffled deck' do
      test_deck = Deck.fresh_deck({:shuffled => false})
      test_card1 = Card.create({:value => 0, :suit => 0, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      test_card2 = Card.create({:value => 0, :suit => 1, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      test_card3 = Card.create({:value => 0, :suit => 2, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      test_card4 = Card.create({:value => 0, :suit => 3, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      expect(test_deck.draw(4)).to eq([test_card1, test_card2, test_card3, test_card4])
    end
  end

  describe('#draw_latest_discard') do
    it 'draws one card from the discard pile' do
    test_deck = Deck.fresh_deck({:shuffled => false})
    test_card1 = test_deck.cards.find_by deck_card_order: 0
    test_card1.discard
    expect(test_deck.draw_latest_discard).to eq(test_card1)
    end
  end

  describe('#draw_latest_discard') do
    it 'draws one card from the discard pile' do
    test_deck = Deck.fresh_deck({:shuffled => false})
    test_card1 = test_deck.cards.find_by deck_card_order: 0
    test_card1.discard
    test_card2 = test_deck.cards.find_by deck_card_order: 1
    test_card2.discard
    expect(test_deck.draw_latest_discard).to eq(test_card2)
    end
  end

  describe('#draw_latest_discard') do
    it 'draws one card from the discard pile' do
    test_deck = Deck.fresh_deck({:shuffled => false})
    test_card1 = test_deck.cards.find_by deck_card_order: 0
    test_card1.discard
    test_card3 = test_deck.cards.find_by deck_card_order: 2
    test_card3.discard
    test_card2 = test_deck.cards.find_by deck_card_order: 1
    test_card2.discard
    expect(test_deck.draw_latest_discard).to eq(test_card2)
    end
  end

end
