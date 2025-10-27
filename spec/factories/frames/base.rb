FactoryBot.define do
  factory :frame do
    trait :common_frame do
      center_x { 10.0 }
      center_y { 8.0 }
      width { 12.0 }
      height { 6.0 }
    end

    trait :second_common_frame do
      center_x { 25.0 }
      center_y { 6.0 }
      width { 14.0 }
      height { 10.0 }
    end

    trait :square_frame do
      center_x { 10.0 }
      center_y { 10.0 }
      width { 10.0 }
      height { 10.0 }
    end
  end
end
