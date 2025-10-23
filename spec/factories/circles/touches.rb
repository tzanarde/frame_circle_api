FactoryBot.modify do
  factory :circle do
    trait :circle_touching_top_frame_border do
      center_x { 10.0 }
      center_y { 9.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_touching_right_frame_border do
      center_x { 14.0 }
      center_y { 8.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_touching_bottom_frame_border do
      center_x { 10.0 }
      center_y { 7.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_touching_left_frame_border do
      center_x { 6.0 }
      center_y { 8.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_touching_two_frame_borders do
      center_x { 14.0 }
      center_y { 9.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_touching_three_frame_borders do
      center_x { 13.0 }
      center_y { 8.0 }
      diameter { 6.0 }
      frame_id { nil }
    end

    trait :circle_touching_four_frame_borders do
      center_x { 10.0 }
      center_y { 10.0 }
      diameter { 10.0 }
      frame_id { nil }
    end

    trait :circle_to_touch do
      center_x { 13.0 }
      center_y { 8.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :secondary_circle_to_touch do
      center_x { 7.0 }
      center_y { 8.0 }
      diameter { 2.0 }
      frame_id { nil }
    end
  end
end
