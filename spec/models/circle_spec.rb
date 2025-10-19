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

    context 'for the frame-circle relation' do
      context 'for a valid circle' do
        context 'with a frame related' do
          context 'within a frame' do
            it 'creates a circle' do

            end
          end
          context 'touching the frame' do
            context 'on only one border' do
              context 'for the top border' do
                it 'creates a circle' do

                end
              end
              context 'for the right border' do
                it 'creates a circle' do

                end
              end
              context 'for the bottom border' do
                it 'creates a circle' do

                end
              end
              context 'for the left border' do
                it 'creates a circle' do

                end
              end
            end
            context 'on two borders' do
              context 'for the top and right borders' do
                it 'creates a circle' do

                end
              end
              context 'for the right and bottom borders' do
                it 'creates a circle' do

                end
              end
              context 'for the bottom and left borders' do
                it 'creates a circle' do

                end
              end
              context 'for the left and top borders' do
                it 'creates a circle' do

                end
              end
              context 'for the top and bottom borders' do
                it 'creates a circle' do

                end
              end
              context 'for the left and right borders' do
                it 'creates a circle' do

                end
              end
            end
            context 'on three borders' do
              context 'for the top, right and bottom borders' do
                it 'creates a circle' do

                end
              end
              context 'for the right, bottom and left borders' do
                it 'creates a circle' do

                end
              end
              context 'for the bottom, left and top borders' do
                it 'creates a circle' do

                end
              end
              context 'for the left, top and right borders' do
                it 'creates a circle' do

                end
              end
            end
            context 'on all four borders' do
              it 'creates a circle' do

              end
            end
          end
        end
      end
      context 'for an invalid circle' do
        context 'with a frame related' do
          context 'passing through the frame' do
            context 'on only one border' do
              context 'for the top border' do
                it 'do not create a circle' do

                end
              end
              context 'for the right border' do
                it 'do not create a circle' do

                end
              end
              context 'for the bottom border' do
                it 'do not create a circle' do

                end
              end
              context 'for the left border' do
                it 'do not create a circle' do

                end
              end
            end
            context 'on two borders' do
              context 'for the top and right borders' do
                it 'do not create a circle' do

                end
              end
              context 'for the right and bottom borders' do
                it 'do not create a circle' do

                end
              end
              context 'for the bottom and left borders' do
                it 'do not create a circle' do

                end
              end
              context 'for the left and top borders' do
                it 'do not create a circle' do

                end
              end
              context 'for the top and bottom borders' do
                it 'do not create a circle' do

                end
              end
              context 'for the left and right borders' do
                it 'do not create a circle' do

                end
              end
            end
            context 'on three borders' do
              context 'for the top, right and bottom borders' do
                it 'do not create a circle' do

                end
              end
              context 'for the right, bottom and left borders' do
                it 'do not create a circle' do

                end
              end
              context 'for the bottom, left and top borders' do
                it 'do not create a circle' do

                end
              end
              context 'for the left, top and right borders' do
                it 'do not create a circle' do

                end
              end
            end
            context 'on all four borders' do
              it 'do not create a circle' do

              end
            end
          end
          context 'completely out of the frame' do
            it 'do not create a circle' do

            end
          end
        end
        context 'with no frame related' do
          it 'do not create a circle' do

          end
        end
      end
    end
    context 'for the circle-circle relation' do
      context 'for a valid circle' do
        context 'not passing through another circle' do
          context 'not touching another circle' do
            it 'creates a circle' do

            end
          end
        end
      end
      context 'for an invalid circle' do
        context 'passing through another circle' do
          context 'on only one circle' do
            it 'do not create a circle' do
              
            end
          end
          context 'on multiple circles' do
            it 'do not create a circle' do
              
            end
          end
        end
        context 'touching another circle' do
          context 'on only one circle' do
            it 'do not create a circle' do
              
            end
          end
          context 'on multiple circles' do
            it 'do not create a circle' do
              
            end
          end
        end
      end
    end
    context 'for large quantities of frames and circles' do
      context 'with a thousand frames' do
        context 'with a thousand circles on each frame' do
          it 'creates a circle in a short time' do
            time = Benchmark.measure do

            end
          end
        end
      end
    end
  end
end
