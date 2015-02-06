class Game < ActiveRecord::Base
  has_many(:decks)
  has_many(:players)
  has_many(:hands)

  def begin_game
    new_deck = Deck.fresh_deck({:shuffled => true})
    self.decks << new_deck
    self.players.count.times do |counter|
      player = self.players[counter]
      hand = player.hands.first
      hand.put_cards_in_hand(new_deck.draw(6))
    end
    new_deck.draw(1).discard
    self.update({:current_player_id => self.players[0].id})
  end

  def end_turn
    current_player = Player.find(self.current_player_id)

    last_turn_check = current_player.hands[0].all_card_flipped?



    #current player number
    cpn = current_player.player_number
    npn = (current_player.player_number + 1) % self.players.count

    if npn == 0
      npn = self.players.count
    end

    new_player = Player.find_by player_number: npn
    self.update({:current_player_id => new_player.id})


  end


end
