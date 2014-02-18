class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :mobile
      t.string :movie_name

      t.timestamps
    end
  end
end
