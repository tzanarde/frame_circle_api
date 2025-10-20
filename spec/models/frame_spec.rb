require 'rails_helper'

RSpec.describe Frame, type: :model do
  describe "associations" do
    it { should have_many(:circles) }
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
      let(:attributes_for_frame_to_add) { attributes_for(:frame, :commom_frame) }
      let(:frame_to_add) { Frame.create(attributes_for_frame_to_add) }
      context 'when the frame is valid' do
        context 'not overlapping or touching another frame' do
          it_behaves_like 'a valid frame'
        end
      end
      context 'when the frame is invalid' do
        context 'overlapping another frame' do
          context 'overlapping only one frame and affecting only one border' do
            context 'when the existing frame is on the top' do
              before { create(:frame, :existing_frame_overlapping_the_top_border) }

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :top
            end
            context 'when the existing frame is on the right' do
              before { create(:frame, :existing_frame_overlapping_the_right_border) }

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :right
            end
            context 'when the existing frame is on the bottom' do
              before { create(:frame, :existing_frame_overlapping_the_bottom_border) }

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :bottom
            end
            context 'when the existing frame is on the left' do
              before { create(:frame, :existing_frame_overlapping_the_left_border) }

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :left
            end
          end
          context 'overlapping multiple existing frames' do
            context 'when the existing frames are on the same border' do
              before do
                create(:frame, :existing_frame_overlapping_the_top_border)
                create(:frame, :second_existing_frame_overlapping_the_top_border)
              end

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :top
            end
            context 'when the existing frames are on different borders' do
              context 'on two borders' do
                before do
                  create(:frame, :existing_frame_overlapping_the_top_border)
                  create(:frame, :existing_frame_overlapping_the_right_border)
                end

                it_behaves_like 'an invalid frame overlapping or touching multiple borders and returning error'
              end
              context 'on three borders' do
                before do
                  create(:frame, :existing_frame_overlapping_the_top_border)
                  create(:frame, :existing_frame_overlapping_the_right_border)
                  create(:frame, :existing_frame_overlapping_the_bottom_border)
                end
                
                it_behaves_like 'an invalid frame overlapping or touching multiple borders and returning error'
              end
              context 'on all four borders' do
                before do
                  create(:frame, :existing_frame_overlapping_the_top_border)
                  create(:frame, :existing_frame_overlapping_the_right_border)
                  create(:frame, :existing_frame_overlapping_the_bottom_border)
                  create(:frame, :existing_frame_overlapping_the_left_border)
                end
                  
                  it_behaves_like 'an invalid frame overlapping or touching multiple borders and returning error'
              end
            end
          end
        end
        context 'touching another frame' do
          context 'touching only one frame' do
            context 'when the existing frame is on the top' do
              before { create(:frame, :existing_frame_touching_the_top_border) }

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :top
            end
            context 'when the existing frame is on the right' do
              before { create(:frame, :existing_frame_touching_the_right_border) }

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :right
            end
            context 'when the existing frame is on the bottom' do
              before { create(:frame, :existing_frame_touching_the_bottom_border) }

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :bottom
            end
            context 'when the existing frame is on the left' do
              before { create(:frame, :existing_frame_touching_the_left_border) }

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :left
            end
          end
          context 'touching multiple existing frames' do
            context 'when the existing frames are on the same border' do
              before do
                create(:frame, :existing_frame_touching_the_top_border)
                create(:frame, :second_existing_frame_touching_the_top_border)
              end

              it_behaves_like 'an invalid frame overlapping or touching a border and returning error', :top
            end
            context 'when the existing frames are on different borders' do
              context 'on two borders' do
                before do
                  create(:frame, :existing_frame_touching_the_top_border)
                  create(:frame, :existing_frame_touching_the_right_border)
                end

                it_behaves_like 'an invalid frame overlapping or touching multiple borders and returning error'
              end
              context 'on three borders' do
                before do
                  create(:frame, :existing_frame_touching_the_top_border)
                  create(:frame, :existing_frame_touching_the_right_border)
                  create(:frame, :existing_frame_touching_the_bottom_border)
                end

                it_behaves_like 'an invalid frame overlapping or touching multiple borders and returning error'
              end
              context 'on all four borders' do
                before do
                  create(:frame, :existing_frame_touching_the_top_border)
                  create(:frame, :existing_frame_touching_the_right_border)
                  create(:frame, :existing_frame_touching_the_bottom_border)
                  create(:frame, :existing_frame_touching_the_left_border)
                end

                it_behaves_like 'an invalid frame overlapping or touching multiple borders and returning error'
              end
            end
          end
        end
      end
    end
  end
end
