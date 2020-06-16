class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
        t.string :item_1
        t.string :item_type
        
        t.timestamps null:false
    end
  end
end
