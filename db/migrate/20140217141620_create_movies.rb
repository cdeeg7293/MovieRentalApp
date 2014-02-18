class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :language
      t.string :year_of_release
      t.string :genre

      t.timestamps
    end
  end
end
