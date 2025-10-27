RSpec.shared_context 'with a circle to add' do |circle_trait, attributes_for_circle, circle|
  let(attributes_for_circle) { attributes_for(:circle, circle_trait, frame: existing_frame) }
  let(circle) { Circle.new(attributes_for_circle_to_add) }
end

RSpec.shared_context 'with circle attributes to add' do |circle_trait|
  let!(:circle_params) { { circle: attributes_for(:circle, circle_trait) } }
end
