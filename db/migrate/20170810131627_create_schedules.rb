class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
    t.references :day, index:true, foreign_key: true, null: false
    t.references :recipe, index:true
    t.references :user, index:true, foreign_key: true, null: false
    end
  end
end
