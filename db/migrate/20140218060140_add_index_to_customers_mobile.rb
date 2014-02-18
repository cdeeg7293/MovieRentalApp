class AddIndexToCustomersMobile < ActiveRecord::Migration
  def change
    add_index :customers, :mobile, unique: true
  end
end
