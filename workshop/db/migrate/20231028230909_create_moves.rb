# frozen_string_literal: true

ROM::SQL.migration do
  up do
    AppContainer['persistance.container'].gateways[:default].connection[<<-SQL].all
      CREATE TABLE moves (
        id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        game_id UUID NOT NULL REFERENCES games(id),
        x_pos INTEGER NOT NULL,
        y_pos INTEGER NOT NULL,
        movement_index INTEGER NOT NULL,
        UNIQUE (game_id, movement_index)
      );
    SQL
  end

  down do
    drop_table :moves
  end
end
