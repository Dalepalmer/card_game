class Card < ActiveRecord::Base
  belongs_to(:deck)

  def discard
    self.update(:hand_id => 10)
  end

  def ==(other_card)
    ((self.value)==(other_card.value))&&((self.suit)==(other_card.suit))
  end

  def flip
    if self.flipped == false
      self.update({:flipped => true})
    else
      self.update({:flipped => false})
    end
  end
end
