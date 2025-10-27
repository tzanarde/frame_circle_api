RSpec.shared_context 'with a frame to add' do |frame_trait|
  let(:attributes_for_frame_to_add) { attributes_for(:frame, frame_trait) }
  let(:frame_to_add) { Frame.new(attributes_for_frame_to_add) }
end

RSpec.shared_context 'with frame attributes to add with circles within' do |frame_trait, circle_traits|
  let!(:frame_params) do
    attributes_for(:frame, frame_trait)
      .merge(circles_attributes: Array(circle_traits).map { |circle_trait| attributes_for(:circle, circle_trait) })
  end
end

RSpec.shared_context 'with a frame with invalid circles within' do |frame_trait, circle_traits|
  include_context 'with frame attributes to add with circles within', :common_frame, [:circle_overlapping_top_frame_border]
end

RSpec.shared_context 'with an invalid frame to update the circle' do
  let(:circle_params) do
    { circle: attributes_for(:circle, :first_circle_new_position, frame_id: 99999) }
  end
end

RSpec.shared_context 'with frame attributes to add' do |frame_trait|
  let!(:frame_params) { attributes_for(:frame, frame_trait) }
end

RSpec.shared_context 'with frame with circles within' do |frame_trait, circle_traits|
  let!(:existing_frame) { create(:frame, frame_trait) }
  let!(:circles) do
    circle_traits.map { |circle_trait| create(:circle, circle_trait, frame: existing_frame) }
  end
end