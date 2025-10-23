FactoryBot.modify do
  factory :frame do
    trait :existing_frame_touching_the_top_border do
      center_x { 4.0 }
      center_y { 12.0 }
      width { 4.0 }
      height { 2.0 }
    end

    trait :second_existing_frame_touching_the_top_border do
      center_x { 16.0 }
      center_y { 13.0 }
      width { 2.0 }
      height { 4.0 }
    end

    trait :existing_frame_touching_the_right_border do
      center_x { 18.0 }
      center_y { 4.5 }
      width { 4.0 }
      height { 2.0 }
    end

    trait :existing_frame_touching_the_bottom_border do
      center_x { 9.0 }
      center_y { 4.0 }
      width { 1.0 }
      height { 2.0 }
    end

    trait :existing_frame_touching_the_left_border do
      center_x { 3.0 }
      center_y { 5.0 }
      width { 2.0 }
      height { 2.0 }
    end

    trait :existing_frame_touching_top_right_corner do
      center_x { 17.0 }
      center_y { 12.0 }
      width { 2.0 }
      height { 2.0 }
    end

    trait :existing_frame_touching_bottom_right_corner do
      center_x { 17.0 }
      center_y { 4.0 }
      width { 2.0 }
      height { 2.0 }
    end

    trait :existing_frame_touching_bottom_left_corner do
      center_x { 3.0 }
      center_y { 4.0 }
      width { 2.0 }
      height { 2.0 }
    end

    trait :existing_frame_touching_top_left_corner do
      center_x { 3.0 }
      center_y { 12.0 }
      width { 2.0 }
      height { 2.0 }
    end
  end
end
