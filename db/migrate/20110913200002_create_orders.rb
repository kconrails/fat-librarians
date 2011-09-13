class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      
      t.string :delivery
      
      t.decimal :total, :precision => 6, :scale => 2
      
      t.string :status
      
      t.integer :customer_id

      t.timestamps
    end
    
    add_index :orders, :customer_id
  end

  def self.down
    remove_index :orders, :customer_id
    drop_table :orders
  end
end
