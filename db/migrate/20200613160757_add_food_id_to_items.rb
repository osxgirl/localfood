class AddFoodIdToItems < ActiveRecord::Migration[6.0]
 def change
       add_column :items, :food_id, :integer
     end
     
   end

