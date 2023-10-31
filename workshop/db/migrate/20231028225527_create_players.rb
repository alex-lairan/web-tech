# frozen_string_literal: true

ROM::SQL.migration do
  up do
    AppContainer['persistance.container'].gateways[:default].connection[<<-SQL].all
      CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

      CREATE TABLE players (
        id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        name TEXT NOT NULL
      );
    SQL
  end

  down do
    drop_table :players
  end
end
