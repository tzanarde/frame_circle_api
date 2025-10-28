RSpec.shared_context 'with an existing circle' do |existing_circle, existing_frame, circle_trait|
  let!(existing_circle) { create(:circle, circle_trait, frame: public_send(existing_frame)) }
end

RSpec.shared_context 'with an extreme circle within the frame' do |position|
  let!(:"#{position}_circle".to_sym) { create(:circle, "#{position}_circle_within_the_frame".to_sym, frame: existing_frame) }
end

RSpec.shared_context 'with two frames with circles within' do
  let!(:first_existing_frame) { create(:frame, :common_frame) }
  let!(:second_existing_frame) { create(:frame, :second_common_frame) }

  let!(:circles_to_add_index) { [:first, :second, :third, :fourth, :fifth, :sixth] }

  let!(:first_existing_frame_circles) do
    circles_to_add_index.map do |index|
      create(:circle, "#{index}_circle_within_first_frame".to_sym, frame_id: first_existing_frame.id)
    end
  end

  let!(:second_existing_frame_circles) do
    circles_to_add_index.map do |index|
      create(:circle, "#{index}_circle_within_second_frame".to_sym, frame_id: second_existing_frame.id)
    end
  end
end
