FactoryBot.modify do
  factory :circle do
    trait :circle_overlapping_top_frame_border do
      center_x { 10.0 }
      center_y { 10.0 }
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

    trait :circle_overlapping_two_frame_borders do
      center_x { 14.0 }
      center_y { 9.0 }
      diameter { 6.0 }
      frame_id { nil }
    end

    trait :circle_overlapping_three_frame_borders do
      center_x { 13.0 }
      center_y { 8.0 }
      diameter { 8.0 }
      frame_id { nil }
    end

    trait :circle_overlapping_four_frame_borders do
      center_x { 10.0 }
      center_y { 10.0 }
      diameter { 12.0 }
      frame_id { nil }
    end

    trait :circle_to_overlap do
      center_x { 13.0 }
      center_y { 8.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :secondary_circle_to_overlap do
      center_x { 7.0 }
      center_y { 8.0 }
      diameter { 4.0 }
      frame_id { nil }
    end
  end
end
