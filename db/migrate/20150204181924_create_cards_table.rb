class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table(:cards) do |t|
      t.integer :value
      t.integer :suit
      t.integer :deck_id
      t.integer :hand_id
      t.integer :deck_card_order
      t.boolean :flipped
    end

    create_table(:decks) do |t|
      t.integer :game_id
    end

    create_table(:games) do |t|
      t.boolean :ended
      t.string :winner
      t.integer :rounds_played
      t.integer :current_player_id
      t.boolean :last_turn
    end

    create_table(:players) do |t|
      t.string :name
      t.string :current_score
      t.integer :player_number
      t.belongs_to :game
    end

    create_table(:hands) do |t|
      t.boolean :winner
      t.integer :final_score
      t.integer :zero_zero_card
      t.integer :zero_one_card
      t.integer :one_zero_card
      t.integer :one_one_card
      t.integer :two_zero_card
      t.integer :two_one_card
      t.belongs_to :player
      t.timestamps
    end
  end
end
