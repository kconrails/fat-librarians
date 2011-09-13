class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string  :name,    :null => false
      t.decimal :price,   :null => false, :precision => 6, :scale => 2
      t.decimal :weight,  :null => false, :precision => 6, :scale => 2

      t.timestamps
    end
    
    create_table :items_orders, :id => false do |t|
      t.integer :item_id,   :null => false
      t.integer :order_id,  :null => false
    end
    
    add_index :items_orders, [:item_id, :order_id]
  end

  def self.down
    remove_index :items_orders, [:item_id, :order_id]
    drop_table :items
  end
end
