class Deck < ActiveRecord::Base
  has_many(:cards)
  belongs_to(:game)


  define_singleton_method(:fresh_deck) do |params|
    deck = Deck.create
    13.times() do |values|
      4.times() do |suit|
        Card.create({:value => values, :suit => suit, :deck_card_order => nil, :deck_id => deck.id(), :hand_id => 0})
      end
    end
    if params[:shuffled] == false
      counter = 0
      deck.cards.each do |card|
        card.update({:deck_card_order => counter})
        counter += 1
      end
    else
      deck.shuffle
    end
    deck
  end

  def draw(draw_times)
    output = []
    counter = 0
    number_of_drawn_cards = 0
    until number_of_drawn_cards == draw_times do
    @card = self.cards.find_by deck_card_order: counter
        if @card.hand_id == 0
          output.push(@card)
          number_of_drawn_cards += 1
        end
   counter += 1
  end
    if output.length > 1
      output
    else
      output[0]
    end
  end

  def shuffle
    new_array = (0..51).to_a
    self.cards.each do |card|
      sample_card = new_array.sample()
      new_array.delete(sample_card)
      card.update({:deck_card_order => sample_card})
    end
  end

    def draw_latest_discard
      result = self.cards.where("hand_id = 10")
      result = result[result.length-1]
    end
end
