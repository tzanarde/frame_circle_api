FactoryBot.define do
  factory :frame do
    trait :commom_frame do
      center_x { 10.0 }
      center_y { 8.0 }
      width { 12.0 }
      height { 6.0 }
    end

    trait :large_frame do
      center_x { 10.0 }
      center_y { 10.0 }
      width { 20.0 }
      height { 20.0 }
    end

    trait :rectangular_frame do
      center_x { 10.0 }
      center_y { 10.0 }
      width { 20.0 }
      height { 20.0 }
    end

    # On the TOP examples
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

    # On the RIGHT examples
    trait :existing_frame_overlapping_the_right_border do
      center_x { 17.0 }
      center_y { 7.0 }
      width { 4.0 }
      height { 2.0 }
    end

    trait :existing_frame_touching_the_right_border do
      center_x { 18.0 }
      center_y { 4.5 }
      width { 4.0 }
      height { 2.0 }
    end

    # On the BOTTOM examples
    trait :existing_frame_overlapping_the_bottom_border do
      center_x { 6.5 }
      center_y { 4.5 }
      width { 3.0 }
      height { 3.0 }
    end

    trait :existing_frame_touching_the_bottom_border do
      center_x { 9.0 }
      center_y { 4.0 }
      width { 1.0 }
      height { 2.0 }
    end

    # On the LEFT examples
    trait :existing_frame_overlapping_the_left_border do
      center_x { 4.0 }
      center_y { 9.5 }
      width { 6.0 }
      height { 1.0 }
    end

    trait :existing_frame_touching_the_left_border do
      center_x { 3.0 }
      center_y { 5.0 }
      width { 2.0 }
      height { 2.0 }
    end
  end
end
