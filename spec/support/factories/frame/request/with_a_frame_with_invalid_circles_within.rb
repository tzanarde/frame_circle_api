RSpec.shared_context 'with a frame with invalid circles within' do |frame_trait, circle_traits|
  include_context 'with frame attributes to add with circles within',
                  :common_frame,
                  [:circle_overlapping_top_frame_border]
end
