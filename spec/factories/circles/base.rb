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

    trait :first_circle_within_first_frame do
      center_x { 5.0 }
      center_y { 6.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :second_circle_within_first_frame do
      center_x { 6.0 }
      center_y { 9.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :third_circle_within_first_frame do
      center_x { 9.0 }
      center_y { 7.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :fourth_circle_within_first_frame do
      center_x { 11.0 }
      center_y { 9.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :fifth_circle_within_first_frame do
      center_x { 14.0 }
      center_y { 7.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :sixth_circle_within_first_frame do
      center_x { 15.0 }
      center_y { 10.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :first_circle_within_second_frame do
      center_x { 21.0 }
      center_y { 8.0 }
      diameter { 6.0 }
      frame_id { nil }
    end

    trait :second_circle_within_second_frame do
      center_x { 20.0 }
      center_y { 3.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :third_circle_within_second_frame do
      center_x { 24.0 }
      center_y { 2.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :fourth_circle_within_second_frame do
      center_x { 28.0 }
      center_y { 4.0 }
      diameter { 6.0 }
      frame_id { nil }
    end

    trait :fifth_circle_within_second_frame do
      center_x { 27.0 }
      center_y { 10.0 }
      diameter { 2.0 }
      frame_id { nil }
    end

    trait :sixth_circle_within_second_frame do
      center_x { 30.0 }
      center_y { 9.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :first_circle_new_position do
      center_x { 10.0 }
      center_y { 10.0 }
      diameter { 1.0 }
      frame_id { nil }
    end

    trait :first_circle_new_frame do
      center_x { 26.0 }
      center_y { 8.5 }
      diameter { 1.0 }
      frame_id { nil }
    end

    trait :circle_new_position_overlapping_existing_circle do
      center_x { 13.0 }
      center_y { 8.0 }
      diameter { 4.0 }
      frame_id { nil }
    end

    trait :circle_new_position_overlapping_frame do
      center_x { 8.0 }
      center_y { 11.0 }
      diameter { 2.0 }
      frame_id { nil }
    end
  end
end
