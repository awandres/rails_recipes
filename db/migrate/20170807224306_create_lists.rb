class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.references :recipe, index: true, foreign_key: true, null:false
      t.references :ingredient, index: true,  foreign_key: true, null: false
    end
  end
end
