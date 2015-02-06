require "spec_helper"

describe('#begin_game') do
  it 'begins the game, counts players' do
  @test_game = Game.create({:ended => false, :rounds_played => 0, :winner => nil, :last_turn => false})
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

describe('#end_turn') do
  it 'ends the turn for the current player and begins it for the next' do
    @test_game = Game.create({:ended => false, :rounds_played => 0, :winner => nil, :last_turn => false})
    player1 = Player.create(:name => "Alex", :current_score => 0, :player_number => 1)
    hand1 = Hand.create(:winner => false, :final_score => 0, :zero_zero_card => nil, :zero_one_card => nil, :one_zero_card => nil, :one_one_card => nil, :two_zero_card => nil, :two_one_card => nil, :player => nil)
    player1.hands << hand1
    player2 = Player.create(:name => "Dale", :current_score => 0, :player_number => 2)
    hand2 = Hand.create(:winner => false, :final_score => 0, :zero_zero_card => nil, :zero_one_card => nil, :one_zero_card => nil, :one_one_card => nil, :two_zero_card => nil, :two_one_card => nil, :player => nil)
    player2.hands << hand2
    @test_game.players << [player1, player2]
    @test_game.begin_game

    deck = @test_game.decks[0]
    draw_card = deck.draw(1)
    player1.hands[0].switch(0, draw_card)

    @test_game.end_turn
    expect(@test_game.current_player_id).to eq(player2.id)
  end
end

describe('#end_game') do
  it 'ends the game, calculates the final score of each player' do
    @test_game = Game.create({:ended => false, :rounds_played => 0, :winner => nil, :last_turn => false})
    player1 = Player.create(:name => "Alex", :current_score => 0, :player_number => 1)
    hand1 = Hand.create(:winner => false, :final_score => 0, :zero_zero_card => nil, :zero_one_card => nil, :one_zero_card => nil, :one_one_card => nil, :two_zero_card => nil, :two_one_card => nil, :player => nil)
    player1.hands << hand1
    player2 = Player.create(:name => "Dale", :current_score => 0, :player_number => 2)
    hand2 = Hand.create(:winner => false, :final_score => 0, :zero_zero_card => nil, :zero_one_card => nil, :one_zero_card => nil, :one_one_card => nil, :two_zero_card => nil, :two_one_card => nil, :player => nil)
    player2.hands << hand2
    @test_game.players << [player1, player2]
    @test_game.begin_game

    deck = @test_game.decks[0]
    draw_card = deck.draw(1)
    player1.hands[0].switch(0, draw_card)

    @test_game.end_turn
    expect(@test_game.current_player_id).to eq(player2.id)
  end
end
