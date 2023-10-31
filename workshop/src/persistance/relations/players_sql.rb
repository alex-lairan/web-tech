module Persistance
  module Relations
    class PlayersSql < ROM::Relation[:sql]
      schema(:players, as: :players_sql) do
        attribute :id, Types::PG::UUID
        attribute :name, Types::String

        primary_key :id
      end

      def for_ids(ids)
        where(id: ids)
      end
    end
  end
end
