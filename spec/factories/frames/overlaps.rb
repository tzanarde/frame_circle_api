FactoryBot.modify do
  factory :frame do
    trait :existing_frame_overlapping_the_top_border do
      center_x { 12.0 }
      center_y { 12.0 }
      width { 4.0 }
      height { 4.0 }
    end

    trait :second_existing_frame_overlapping_the_top_border do
      center_x { 8.5 }
      center_y { 11.5 }
      width { 1.0 }
      height { 3.0 }
    end

    trait :existing_frame_overlapping_the_right_border do
      center_x { 17.0 }
      center_y { 7.0 }
      width { 4.0 }
      height { 2.0 }
    end

    trait :existing_frame_overlapping_the_bottom_border do
      center_x { 6.5 }
      center_y { 4.5 }
      width { 3.0 }
      height { 3.0 }
    end

    trait :existing_frame_overlapping_the_left_border do
      center_x { 4.0 }
      center_y { 9.5 }
      width { 6.0 }
      height { 1.0 }
    end

    trait :existing_frame_overlapping_top_right_corner do
      center_x { 16.0 }
      center_y { 11.0 }
      width { 2.0 }
      height { 2.0 }
    end

    trait :existing_frame_overlapping_bottom_right_corner do
      center_x { 16.0 }
      center_y { 5.0 }
      width { 2.0 }
      height { 2.0 }
    end

    trait :existing_frame_overlapping_bottom_left_corner do
      center_x { 4.0 }
      center_y { 5.0 }
      width { 2.0 }
      height { 2.0 }
    end

    trait :existing_frame_overlapping_top_left_corner do
      center_x { 4.0 }
      center_y { 11.0 }
      width { 2.0 }
      height { 2.0 }
    end

    trait :existing_frame_vertically_crossing_the_new_frame do
      center_x { 6.5 }
      center_y { 8.0 }
      width { 1.0 }
      height { 12.0 }
    end

    trait :existing_frame_horizontally_crossing_the_new_frame do
      center_x { 10.0 }
      center_y { 8.0 }
      width { 16.0 }
      height { 2.0 }
    end

    trait :existing_frame_completely_within_the_new_frame do
      center_x { 10.0 }
      center_y { 8.0 }
      width { 2.0 }
      height { 2.0 }
    end

    trait :existing_frame_completely_encompassing_the_new_frame do
      center_x { 10.0 }
      center_y { 8.0 }
      width { 16.0 }
      height { 10.0 }
    end
  end
end
