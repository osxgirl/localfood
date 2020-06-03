class Desserts < ActiveRecord::Migration[6.0]
   def change
        create_table :desserts do |t|
          t.string :business
          t.text :website

          t.timestamps
        end
      end
end
