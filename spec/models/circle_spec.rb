require 'rails_helper'

RSpec.describe Circle, type: :model do
  describe "associations" do
    it { should belong_to(:frame) }
  end

  describe 'validations' do
    context 'for the fields presence' do
      it { should validate_presence_of(:center_x) }
      it { should validate_presence_of(:center_y) }
      it { should validate_presence_of(:diameter) }
    end

    context 'for the fields type' do
      it { is_expected.to have_db_column(:center_x).of_type(:decimal) }
      it { is_expected.to have_db_column(:center_y).of_type(:decimal) }
      it { is_expected.to have_db_column(:diameter).of_type(:decimal) }
      it { is_expected.to have_db_column(:frame_id).of_type(:integer) }
    end

    context 'for the decimal fields amount' do
      it { is_expected.to validate_numericality_of(:center_x).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:center_y).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:diameter).is_greater_than_or_equal_to(0) }
    end

    include_context 'with a frame ready for circles', :common_frame
    context 'for the frame-circle relation' do
      context 'when the circle is valid' do
        context 'within a frame' do
          include_context 'with a circle to add', :circle_within_frame

          it_behaves_like 'a valid circle on a frame'
        end
        context 'touching the frame' do
          context 'on only one border' do
            context 'for the top border' do
              include_context 'with a circle to add', :circle_touching_top_frame_border

              it_behaves_like 'a valid circle on a frame'
            end
            context 'for the right border' do
              include_context 'with a circle to add', :circle_touching_right_frame_border

              it_behaves_like 'a valid circle on a frame'
            end
            context 'for the bottom border' do
              include_context 'with a circle to add', :circle_touching_bottom_frame_border

              it_behaves_like 'a valid circle on a frame'
            end
            context 'for the left border' do
              include_context 'with a circle to add', :circle_touching_left_frame_border

              it_behaves_like 'a valid circle on a frame'
            end
          end
          context 'on two borders' do
            include_context 'with a circle to add', :circle_touching_two_frame_borders

            it_behaves_like 'a valid circle on a frame'
          end
          context 'on three borders' do
            include_context 'with a circle to add', :circle_touching_three_frame_borders

            it_behaves_like 'a valid circle on a frame'
          end
          context 'on all four borders' do
            include_context 'with a frame ready for circles', :square_frame
            include_context 'with a circle to add', :circle_touching_four_frame_borders

            it_behaves_like 'a valid circle on a frame'
          end
        end
      end
      context 'when the circle is invalid' do
        context 'overlapping the frame' do
          context 'on only one border' do
            context 'for the top border' do
              include_context 'with a circle to add', :circle_overlapping_top_frame_border

              it_behaves_like 'an invalid circle overlapping a frame'
            end
            context 'for the right border' do
              include_context 'with a circle to add', :circle_overlapping_right_frame_border

              it_behaves_like 'an invalid circle overlapping a frame'
            end
            context 'for the bottom border' do
              include_context 'with a circle to add', :circle_overlapping_bottom_frame_border

              it_behaves_like 'an invalid circle overlapping a frame'
            end
            context 'for the left border' do
              include_context 'with a circle to add', :circle_overlapping_left_frame_border

              it_behaves_like 'an invalid circle overlapping a frame'
            end
          end
          context 'on two borders' do
            context 'for the top and right borders' do
              include_context 'with a circle to add', :circle_overlapping_two_frame_borders

              it_behaves_like 'an invalid circle overlapping a frame'
            end
          end
          context 'on three borders' do
            context 'for the top, right and bottom borders' do
              include_context 'with a circle to add', :circle_overlapping_three_frame_borders

              it_behaves_like 'an invalid circle overlapping a frame'
            end
          end
          context 'on all four borders' do
            include_context 'with a frame ready for circles', :square_frame
            include_context 'with a circle to add', :circle_overlapping_four_frame_borders

            it_behaves_like 'an invalid circle overlapping a frame'
          end
        end
        context 'completely out of the frame' do
          include_context 'with a circle to add', :circle_out_of_the_frame

          it_behaves_like 'an invalid circle overlapping a frame'
        end
      end
    end
    context 'for the circle-circle relation' do
      context 'when the circle is valid' do
        context 'not overlapping another circle' do
          context 'not touching another circle' do
            include_context 'with a circle to add', :circle_within_frame

            it_behaves_like 'a valid circle on a frame'
          end
        end
      end
      context 'when the circle is invalid' do
        context 'overlapping another circle' do
          context 'on only one circle' do
            include_context 'with an existing circle', :circle_within_frame
            include_context 'with a circle to add', :circle_to_overlap

            it_behaves_like 'an invalid circle overlapping or touching another circle'
          end
          context 'on multiple circles' do
            include_context 'with an existing circle', :circle_within_frame
            include_context 'with a circle to add', :circle_to_overlap
            include_context 'with a second circle to add', :secondary_circle_to_overlap

            it_behaves_like 'an invalid circle overlapping or touching other circles'
          end
        end
        context 'touching another circle' do
          context 'on only one circle' do
            include_context 'with an existing circle', :circle_within_frame
            include_context 'with a circle to add', :circle_to_touch

            it_behaves_like 'an invalid circle overlapping or touching another circle'
          end
          context 'on multiple circles' do
            include_context 'with an existing circle', :circle_within_frame
            include_context 'with a circle to add', :circle_to_touch
            include_context 'with a second circle to add', :secondary_circle_to_touch

            it_behaves_like 'an invalid circle overlapping or touching other circles'
          end
        end
      end
    end
  end
end