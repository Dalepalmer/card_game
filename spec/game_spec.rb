require "spec_helper"

describe('#begin_game') do
  it 'begins the game, counts players' do
  @test_game = Game.create({:ended => false, :rounds_played => 0, :winner => nil})
  player1 = Player.create(:name => "Alex", :current_score => 0, :player_number => 1)
  hand1 = Hand.create(:winner => false, :final_score => 0, :zero_zero_card => nil, :zero_one_card => nil, :one_zero_card => nil, :one_one_card => nil, :two_zero_card => nil, :two_one_card => nil, :player => nil)
  player1.hands << hand1
  player2 = Player.create(:name => "Dale", :current_score => 0, :player_number => 2)
  hand2 = Hand.create(:winner => false, :final_score => 0, :zero_zero_card => nil, :zero_one_card => nil, :one_zero_card => nil, :one_one_card => nil, :two_zero_card => nil, :two_one_card => nil, :player => nil)
  player2.hands << hand2
  @test_game.players << [player1, player2]
  @test_game.begin_game
  expect(@test_game.players.count()).to (eq(2))
  end
end
