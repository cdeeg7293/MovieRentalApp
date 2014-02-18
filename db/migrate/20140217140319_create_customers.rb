class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.string :address
      t.integer :movie_count

      t.timestamps
    end
  end
end
