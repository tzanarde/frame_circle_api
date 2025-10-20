FactoryBot.define do
  factory :circle do
    trait :circle_within_frame do
      center_x { 10.0 }
      center_y { 10.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_overlapping_top_frame_border do
      center_x { 10.0 }
      center_y { 16.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_overlapping_right_frame_border do
      center_x { 16.0 }
      center_y { 10.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_overlapping_bottom_frame_border do
      center_x { 10.0 }
      center_y { 4.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_overlapping_left_frame_border do
      center_x { 4.0 }
      center_y { 10.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_touching_two_frame_borders do
      center_x { 12.0 }
      center_y { 12.0 }
      diameter { 8.0 }
      frame_id { nil }
    end

    trait :circle_touching_three_frame_borders do
      center_x { 14.0 }
      center_y { 10.0 }
      diameter { 8.0 }
      frame_id { nil }
    end

    trait :circle_touching_four_frame_borders do
      center_x { 10.0 }
      center_y { 10.0 }
      diameter { 8.0 }
      frame_id { nil }
    end

    trait :circle_out_of_the_frame do
      center_x { 26.0 }
      center_y { 10.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_to_overlap do
      center_x { 12.0 }
      center_y { 14.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :secondary_circle_to_overlap do
      center_x { 6.0 }
      center_y { 6.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :circle_to_touch do
      center_x { 10.0 }
      center_y { 16.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :secondary_circle_to_touch do
      center_x { 10.0 }
      center_y { 4.0 }
      diameter { 2.0 }
      frame_id { nil }
    end
  end
end
