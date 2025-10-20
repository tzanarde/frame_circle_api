require 'rails_helper'
require 'benchmark'

RSpec.describe Circle, type: :model do
  describe "associations" do
    it { should belong_to(:frame) }
  end

  describe 'validations' do
    context 'for the fields presence' do
      it { should validate_presence_of(:center_x) }
      it { should validate_presence_of(:center_y) }
      it { should validate_presence_of(:diameter) }
      it { should validate_presence_of(:frame_id) }
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

    context 'with a frame' do
      let(:frame) { create(:frame, :large_frame) }
      context 'and with a circle to add' do
        let(:attributes_for_circle_to_add) { attributes_for(:circle, :circle_within_frame, frame_id: frame.id) }
        let(:circle_to_add) { Circle.create(attributes_for_circle_to_add) }
        context 'for the frame-circle relation' do
          context 'when the circle is valid' do
            context 'within a frame' do
              before { create(:circle, :circle_within_frame, frame_id: frame.id) }

              it_behaves_like 'a valid circle on a frame'
            end
            context 'touching the frame' do
              context 'on only one border' do
                context 'for the top border' do
                  it_behaves_like 'a valid circle on a frame'
                end
                context 'for the right border' do
                  it_behaves_like 'a valid circle on a frame'
                end
                context 'for the bottom border' do
                  
                  it_behaves_like 'a valid circle on a frame'
                end
                context 'for the left border' do
                  it_behaves_like 'a valid circle on a frame'
                end
              end
              context 'on two borders' do
                context 'for the top and right borders' do
                  it_behaves_like 'a valid circle on a frame'
                end
              end
              context 'on three borders' do
                context 'for the top, right and bottom borders' do
                  it_behaves_like 'a valid circle on a frame'
                end
              end
              context 'on all four borders' do
                it_behaves_like 'a valid circle on a frame'
              end
            end
          end
          context 'when the circle is invalid' do
            context 'overlapping the frame' do
              context 'on only one border' do
                context 'for the top border' do
                  before { create(:circle, :circle_overlapping_top_frame_border, frame_id: frame.id) }

                  it_behaves_like 'an invalid circle overlapping a frame border and returning error', :top
                end
                context 'for the right border' do
                  before { create(:circle, :circle_overlapping_right_frame_border, frame_id: frame.id) }

                  it_behaves_like 'an invalid circle overlapping a frame border and returning error', :right
                end
                context 'for the bottom border' do
                  before { create(:circle, :circle_overlapping_bottom_frame_border, frame_id: frame.id) }

                  it_behaves_like 'an invalid circle overlapping a frame border and returning error', :bottom
                end
                context 'for the left border' do
                  before { create(:circle, :circle_overlapping_left_frame_border, frame_id: frame.id) }

                  it_behaves_like 'an invalid circle overlapping a frame border and returning error', :left
                end
              end
              context 'on two borders' do
                context 'for the top and right borders' do
                  before { create(:circle, :circle_touching_two_frame_borders, frame_id: frame.id) }

                  it_behaves_like 'an invalid circle overlapping multiple frame borders and returning error'
                end
              end
              context 'on three borders' do
                context 'for the top, right and bottom borders' do
                  before { create(:circle, :circle_touching_three_frame_borders, frame: create(:frame, :rectangular_frame)) }

                  it_behaves_like 'an invalid circle overlapping multiple frame borders and returning error'
                end
              end
              context 'on all four borders' do
                before { create(:circle, :circle_touching_four_frame_borders, frame_id: frame.id) }

                it_behaves_like 'an invalid circle overlapping multiple frame borders and returning error'
              end
            end
            context 'completely out of the frame' do
              before { create(:circle, :circle_out_of_the_frame, frame_id: frame.id) }

              it_behaves_like 'an invalid circle out of the frame and returning error'
            end
          end
        end
        context 'for the circle-circle relation' do
          context 'when the circle is valid' do
            context 'not overlapping another circle' do
              context 'not touching another circle' do
                it_behaves_like 'a valid circle on a frame'
              end
            end
          end
          context 'when the circle is invalid' do
            context 'overlapping another circle' do
              context 'on only one circle' do
                before { create(:circle, :circle_to_overlap, frame_id: frame.id) }

                it_behaves_like 'an invalid circle overlapping or touching an existing circle and returning error'
              end
              context 'on multiple circles' do
                before do
                  create(:circle, :circle_to_overlap, frame_id: frame.id)
                  create(:circle, :secondary_circle_to_overlap, frame_id: frame.id)
                end

                it_behaves_like 'an invalid circle overlapping or touching multiple existing circles and returning error'
              end
            end
            context 'touching another circle' do
              context 'on only one circle' do
                before { create(:circle, :circle_to_touch, frame_id: frame.id) }

                it_behaves_like 'an invalid circle overlapping or touching an existing circle and returning error'
              end
              context 'on multiple circles' do
                before do
                  create(:circle, :circle_to_touch, frame_id: frame.id)
                  create(:circle, :secondary_circle_to_touch, frame_id: frame.id)
                end

                it_behaves_like 'an invalid circle overlapping or touching multiple existing circles and returning error'
              end
            end
          end
        end
      end
    end
  end
end