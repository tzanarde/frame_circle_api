class CreateFrames < ActiveRecord::Migration[8.0]
  def change
    create_table :frames do |t|
      t.decimal :center_x, null: false
      t.decimal :center_y, null: false
      t.decimal :height, null: false
      t.decimal :width, null: false

      t.timestamps
    end
  end
end
