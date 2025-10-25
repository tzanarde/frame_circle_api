FactoryBot.define do
  factory :circle do
    trait :circle_within_frame do
      center_x { 10.0 }
      center_y { 8.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :second_circle_within_frame do
      center_x { 14.0 }
      center_y { 8.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :circle_out_of_the_frame do
      center_x { 26.0 }
      center_y { 10.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :topmost_circle_within_the_frame do
      center_x { 10.0 }
      center_y { 10.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :rightmost_circle_within_the_frame do
      center_x { 14.0 }
      center_y { 8.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :bottommost_circle_within_the_frame do
      center_x { 10.0 }
      center_y { 6.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :leftmost_circle_within_the_frame do
      center_x { 6.0 }
      center_y { 8.0 }
      diameter { 2.0 }
      frame_id { nil }
    end
  end
end
