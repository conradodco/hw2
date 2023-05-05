class Addkeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :studio, null: false
    add_reference :roles, :movie, null: false
    add_reference :roles, :actor, null: false

    add_foreign_key :movies, :studios, column: :studio_id
    add_foreign_key :roles, :movies, column: :movie_id
    add_foreign_key :roles, :actors, column: :actor_id
  end
end
