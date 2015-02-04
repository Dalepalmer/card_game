class Card < ActiveRecord::Base
  belongs_to(:deck)

  def ==(other_card)
    ((self.value)==(other_card.value))&&((self.suit)==(other_card.suit))
  end
end
