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

  describe('#fresh_deck') do
    it 'creates a new shuffled deck' do
    test_deck = Deck.fresh_deck({:shuffled => true})
      test_card1 = Card.create({:value => 0, :suit => 0, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      test_card2 = Card.create({:value => 0, :suit => 1, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      test_card3 = Card.create({:value => 0, :suit => 2, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      test_card4 = Card.create({:value => 0, :suit => 3, :deck_card_order => 0, :deck_id => test_deck.id(), :hand_id => 0})
      expect(test_deck.draw(4)==[test_card1, test_card2, test_card3, test_card4]).to eq(false)
    end
  end

  describe('#shuffle') do
    it 'shuffles a deck' do
      test_deck = Deck.fresh_deck({:shuffled => true})
      test_deck.shuffle
      four_cards = test_deck.draw(4)
      test_deck.shuffle
      expect(test_deck.draw(3)).to.eq!(four_cards)
    end
  end
end
