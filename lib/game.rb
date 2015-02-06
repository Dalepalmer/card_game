class Game < ActiveRecord::Base
  has_one(:deck)
  has_many(:players)
  has_many(:hands)

  def begin_game
    new_deck = Deck.fresh_deck({:shuffled => true})
    self.players.count.times do |counter|
      player = self.players[counter]
      hand = player.hands.first
      hand.put_cards_in_hand(new_deck.draw(6))
    end
    new_deck.draw(1).discard
    self.update({:current_player_id => self.players[0].id})
  end

  def start_turn
  end


end
