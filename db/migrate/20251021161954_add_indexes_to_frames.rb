class AddIndexesToFrames < ActiveRecord::Migration[8.0]
  def change
    add_index :frames, Arel.sql("(center_y + (height / 2.0))"), name: "index_frames_on_top_line"
    add_index :frames, Arel.sql("(center_x + (width / 2.0))"), name: "index_frames_on_right_line"
    add_index :frames, Arel.sql("(center_y - (height / 2.0))"), name: "index_frames_on_bottom_line"
    add_index :frames, Arel.sql("(center_x - (width / 2.0))"), name: "index_frames_on_left_line"
  end
end
