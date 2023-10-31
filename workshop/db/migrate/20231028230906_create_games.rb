# frozen_string_literal: true

ROM::SQL.migration do
  up do
    AppContainer['persistance.container'].gateways[:default].connection[<<-SQL].all
      CREATE TABLE games (
        id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        player_x_id UUID NOT NULL REFERENCES players(id),
        player_o_id UUID NOT NULL REFERENCES players(id),
        winner UUID REFERENCES players(id) NULL,
        status TEXT CHECK (status IN ('ongoing', 'finished')) NOT NULL
      );
    SQL
  end

  down do
    drop_table :games
  end
end
