RSpec.shared_context 'with a frame ready for circles' do |frame_trait|
  let!(:existing_frame) { create(:frame, frame_trait) }
end

RSpec.shared_context 'with an existing circle' do |circle_trait|
  let!(:existing_circle) { create(:circle, circle_trait, frame: existing_frame) }
end

RSpec.shared_context 'with a second existing circle' do |circle_trait|
  let!(:second_existing_circle) { create(:circle, circle_trait, frame: existing_frame) }
end

RSpec.shared_context 'with a circle to add' do |circle_trait|
  let(:attributes_for_circle_to_add) { attributes_for(:circle, circle_trait, frame: existing_frame) }
  let(:circle_to_add) { Circle.new(attributes_for_circle_to_add) }
end

RSpec.shared_context 'with a second circle to add' do |circle_trait|
  let(:attributes_for_second_circle_to_add) { attributes_for(:circle, circle_trait, frame: existing_frame) }
  let(:second_circle_to_add) { Circle.new(attributes_for_second_circle_to_add) }
end

RSpec.shared_context 'with an extreme circle within the frame' do |position|
  let!(:"#{position}_circle".to_sym) { create(:circle, "#{position}_circle_within_the_frame".to_sym, frame: existing_frame) }
end
