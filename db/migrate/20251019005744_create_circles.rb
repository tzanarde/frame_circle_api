class CreateCircles < ActiveRecord::Migration[8.0]
  def change
    create_table :circles do |t|
      t.decimal :center_x, null: false
      t.decimal :center_y, null: false
      t.decimal :diameter, null: false
      t.references :frame, null: false, foreign_key: true

      t.timestamps
    end
  end
end
