class Hand < ActiveRecord::Base
  belongs_to(:game)
  belongs_to(:player)

  def put_cards_in_hand(cards)
    self.update({:zero_zero_card => cards[0].id, :zero_one_card => cards[1].id, :one_zero_card => cards[2].id, :one_one_card => cards[3].id, :two_zero_card => cards[4].id, :two_one_card => cards[5].id})
    cards.each() do |card|
      self.update_hand_id_of_card(card)
    end
  end

  def update_hand_id_of_card(card)
    card.update({:hand_id => self.player.player_number})
  end

  def switch(coord, card)
    if coord == 0
      Card.find(self.zero_zero_card).discard
      self.update(:zero_zero_card => card.id)
      self.update_hand_id_of_card(Card.find(self.zero_zero_card))
    elsif coord == 1
      Card.find(self.zero_one_card).discard
      self.update(:zero_one_card => card.id)
      self.update_hand_id_of_card(Card.find(self.zero_one_card))
    elsif coord == 2
      Card.find(self.one_zero_card).discard
      self.update(:one_zero_card => card.id)
      self.update_hand_id_of_card(Card.find(self.one_zero_card))
    elsif coord == 3
      Card.find(self.one_one_card).discard
      self.update(:one_one_card => card.id)
      self.update_hand_id_of_card(Card.find(self.one_one_card))
    elsif coord == 4
      Card.find(self.two_zero_card).discard
      self.update(:two_zero_card => card.id)
      self.update_hand_id_of_card(Card.find(self.two_zero_card))
    else
      Card.find(self.two_one_card).discard
      self.update(:two_one_card => card.id)
      self.update_hand_id_of_card(Card.find(self.two_one_card))
    end
end
end
