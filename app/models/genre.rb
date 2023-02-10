class Genre < ApplicationRecord
  def change
  create_table :genres do |t|
    t.string :name,null:false
    t.timestamps
   end
  end
end
