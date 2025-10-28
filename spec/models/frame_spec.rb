require 'rails_helper'

RSpec.describe Frame, type: :model do
  describe "associations" do
    context 'for the relations' do
      it { should have_many(:circles) }
    end
    context 'for the destroy behavior' do
      context 'when the frame has no circles within' do
        include_context 'with a frame', :frame, :common_frame

        it_behaves_like 'a destroyed frame'
      end
      context 'when the frame has circles within' do
        include_context 'with a frame', :frame, :common_frame
        before do
          create(:circle, :circle_within_frame, frame_id: frame.id)
          create(:circle, :second_circle_within_frame, frame_id: frame.id)
        end

        it_behaves_like 'a not destroyed frame and circles'
      end
    end
  end

  describe 'methods' do
    include_context 'with a frame', :existing_frame, :common_frame
    context 'for the extreme circles' do
      context 'for the topmost_circle method' do
        it_behaves_like 'an extreme position circle within the frame', :topmost
      end
      context 'for the rightmost_circle method' do
        it_behaves_like 'an extreme position circle within the frame', :rightmost
      end
      context 'for the bottommost_circle method' do
        it_behaves_like 'an extreme position circle within the frame', :bottommost
      end
      context 'for the leftmost_circle method' do
        it_behaves_like 'an extreme position circle within the frame', :leftmost
      end
    end
    context 'for the total amount of circles within a frame' do
      include_context 'with an existing circle', :existing_circle, :existing_frame, :circle_within_frame
      include_context 'with an existing circle', :second_existing_circle, :existing_frame, :second_circle_within_frame

      it_behaves_like 'the amount of circles within a frame'
    end
  end

  describe 'validations' do
    context 'for the fields presence' do
      it { should validate_presence_of(:center_x) }
      it { should validate_presence_of(:center_y) }
      it { should validate_presence_of(:height) }
      it { should validate_presence_of(:width) }
    end

    context 'for the fields type' do
      it { is_expected.to have_db_column(:center_x).of_type(:decimal) }
      it { is_expected.to have_db_column(:center_y).of_type(:decimal) }
      it { is_expected.to have_db_column(:width).of_type(:decimal) }
      it { is_expected.to have_db_column(:height).of_type(:decimal) }
    end

    context 'for the decimal fields amount' do
      it { is_expected.to validate_numericality_of(:center_x).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:center_y).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:width).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:height).is_greater_than_or_equal_to(0) }
    end
  
    context 'for the frame-frame relation' do
      context 'when the frame is valid' do
        context 'not overlapping or touching another frame' do
          include_context 'with a frame to add', :common_frame

          it_behaves_like 'a valid frame'
        end
      end
      context 'when the frame is invalid' do
        context 'overlapping another frame' do
          context 'overlapping only one frame' do
            context 'overlapping only one border' do
              context 'when the existing frame is overlapping on the top of the new frame' do
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_top_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'when the existing frame is overlapping on the right of the new frame' do
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_right_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'when the existing frame is overlapping on the bottom of the new frame' do
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_bottom_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'when the existing frame is overlapping on the left of the new frame' do
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_left_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
            end
            context 'overlapping multiple borders' do
              context 'when the overlap is crossing' do
                context 'when the existing frame is vertically crossing the new frame' do
                  include_context 'with a frame', :existing_frame, :existing_frame_vertically_crossing_the_new_frame
                  include_context 'with a frame to add', :common_frame

                  it_behaves_like 'an invalid frame'
                end
                context 'when the existing frame is horizontally crossing the new frame' do
                  include_context 'with a frame', :existing_frame, :existing_frame_horizontally_crossing_the_new_frame
                  include_context 'with a frame to add', :common_frame

                  it_behaves_like 'an invalid frame'
                end
              end
              context 'when the overlap is on the corners' do
                context 'when the existing frame is overlapping on the top/right corner of the new frame' do
                  include_context 'with a frame', :existing_frame, :existing_frame_overlapping_top_right_corner
                  include_context 'with a frame to add', :common_frame

                  it_behaves_like 'an invalid frame'
                end
                context 'when the existing frame is overlapping on the bottom/right corner of the new frame' do
                  include_context 'with a frame', :existing_frame, :existing_frame_overlapping_bottom_right_corner
                  include_context 'with a frame to add', :common_frame

                  it_behaves_like 'an invalid frame'
                end
                context 'when the existing frame is overlapping on the bottom/left corner of the new frame' do
                  include_context 'with a frame', :existing_frame, :existing_frame_overlapping_bottom_left_corner
                  include_context 'with a frame to add', :common_frame

                  it_behaves_like 'an invalid frame'
                end
                context 'when the existing frame is overlapping on the top/left corner of the new frame' do
                  include_context 'with a frame', :existing_frame, :existing_frame_overlapping_top_left_corner
                  include_context 'with a frame to add', :common_frame

                  it_behaves_like 'an invalid frame'
                end
              end
            end
            context 'when the existing frame is completely within the new frame' do
              include_context 'with a frame', :existing_frame, :existing_frame_completely_within_the_new_frame
              include_context 'with a frame to add', :common_frame

              it_behaves_like 'an invalid frame'
            end
            context 'when the existing frame is completely encompassing the new frame' do
              include_context 'with a frame', :existing_frame, :existing_frame_completely_encompassing_the_new_frame
              include_context 'with a frame to add', :common_frame

              it_behaves_like 'an invalid frame'
            end
          end
          context 'overlapping multiple existing frames' do
            context 'when the existing frames are on the same border' do
              include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_top_border
              include_context 'with a frame', :existing_frame, :second_existing_frame_overlapping_the_top_border
              include_context 'with a frame to add', :common_frame

              it_behaves_like 'an invalid frame'
            end
            context 'when the existing frames are on different borders' do
              context 'on two borders' do
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_top_border
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_right_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'on three borders' do
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_top_border
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_right_border
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_bottom_border
                include_context 'with a frame to add', :common_frame
                
                it_behaves_like 'an invalid frame'
              end
              context 'on all four borders' do
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_top_border
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_right_border
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_bottom_border
                include_context 'with a frame', :existing_frame, :existing_frame_overlapping_the_left_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
            end
          end
        end
        context 'touching another frame' do
          context 'touching only one frame' do
            context 'touching only one border' do
              context 'when the existing frame is on the top' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_top_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'when the existing frame is on the right' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_right_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'when the existing frame is on the bottom' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_bottom_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'when the existing frame is on the left' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_left_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
            end
            context 'when is touching the corners' do
              context 'when the existing frame is touching on the top/right corner of the new frame' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_top_right_corner
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'when the existing frame is touching on the bottom/right corner of the new frame' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_bottom_right_corner
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'when the existing frame is touching on the bottom/left corner of the new frame' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_bottom_left_corner
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'when the existing frame is touching on the top/left corner of the new frame' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_top_left_corner
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
            end
            context 'touching multiple borders' do
              context 'when the existing frame is equal to the new frame' do
                  include_context 'with a frame', :existing_frame, :common_frame
                  include_context 'with a frame to add', :common_frame
  
                it_behaves_like 'an invalid frame'
              end
            end
          end
          context 'touching multiple existing frames' do
            context 'when the existing frames are on the same border' do
              include_context 'with a frame', :existing_frame, :existing_frame_touching_the_top_border
              include_context 'with a frame', :existing_frame, :second_existing_frame_touching_the_top_border
              include_context 'with a frame to add', :common_frame

              it_behaves_like 'an invalid frame'
            end
            context 'when the existing frames are on different borders' do
              context 'on two borders' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_top_border
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_right_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'on three borders' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_top_border
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_right_border
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_bottom_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
              context 'on all four borders' do
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_top_border
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_right_border
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_bottom_border
                include_context 'with a frame', :existing_frame, :existing_frame_touching_the_left_border
                include_context 'with a frame to add', :common_frame

                it_behaves_like 'an invalid frame'
              end
            end
          end
        end
      end
    end
  end
end
