class AddMovieNameToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :movie_name, :string
  end
end
