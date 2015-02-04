class Deck < ActiveRecord::Base
  has_many(:cards)
  belongs_to(:game)


  define_singleton_method(:fresh_deck) do |params|
    deck = Deck.create
    13.times() do |values|
      4.times() do |suit|
        Card.create({:value => values, :suit => suit, :deck_id => deck.id(), :hand_id => 0})
      end
    end
    if params[:shuffled] == false
      deck
    else
      deck.shuffle
    end
  end

  def draw(times)
    output = []
      self.cards.each() do |card|
        if output.count == times
          return output
        else
          if card.hand_id == 0
            output.push(card)
          end
        end
      end
    end

    def shuffle()
      #TODO
    end
end
