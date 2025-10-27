RSpec.shared_context 'with circle new frame' do |circle_trait, new_frame|
  let(:circle_params) do
    { circle: attributes_for(:circle, circle_trait, frame_id: second_existing_frame.id) }
  end
end

RSpec.shared_context 'with circle new position' do |circle_trait|
  include_context 'with circle attributes', circle_trait
end

RSpec.shared_context 'with invalid circle position overlapping an existing circle' do |circle_trait|
  include_context 'with circle attributes', circle_trait
end

RSpec.shared_context 'with invalid circle position overlapping the frame' do |circle_trait|
  include_context 'with circle attributes', circle_trait
end

RSpec.shared_context 'with circle attributes' do |circle_trait|
  let(:circle_params) do
    { circle: attributes_for(:circle, circle_trait).slice(:center_x, :center_y, :diameter) }
  end
end