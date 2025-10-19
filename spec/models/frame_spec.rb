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
      it { is_expected.to have_db_column(:height).of_type(:decimal) }
      it { is_expected.to have_db_column(:width).of_type(:decimal) }
    end

    context 'for the decimal fields amount' do
      it { is_expected.to validate_numericality_of(:center_x).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:center_y).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:height).is_greater_than_or_equal_to(0) }
      it { is_expected.to validate_numericality_of(:width).is_greater_than_or_equal_to(0) }
    end

    context 'for the frame-frame relation' do
      context 'for a valid frame' do
        context 'not passing through another frame' do
          context 'not touching another frame' do
            it 'creates a frame' do
              
            end
          end
        end
      end
      context 'for an invalid frame' do
        context 'passing through another frame' do
          context 'passing through only one frame' do
            context 'when the other frame is on the top' do
              it 'do not create a frame' do
  
              end
            end
            context 'when the other frame is on the right' do
              it 'do not create a frame' do
  
              end
            end
            context 'when the other frame is on the bottom' do
              it 'do not create a frame' do
  
              end
            end
            context 'when the other frame is on the left' do
              it 'do not create a frame' do
  
              end
            end
          end
          context 'passing through multiple frames' do
            context 'when the other frames are on the same border' do
              context 'on the top' do
                it 'do not create a frame' do
    
                end
              end
              context 'on the right' do
                it 'do not create a frame' do
    
                end
              end
              context 'on the bottom' do
                it 'do not create a frame' do
    
                end
              end
              context 'on the left' do
                it 'do not create a frame' do
    
                end
              end
            end
            context 'when the other frames are on diferent borders' do
              context 'on two borders' do
                context 'for the top and right borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the right and bottom borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the bottom and left borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the left and top borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the top and bottom borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the left and right borders' do
                  it 'do not create a frame' do

                  end
                end
              end
              context 'on three borders' do
                context 'for the top, right and bottom borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the right, bottom and left borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the bottom, left and top borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the left, top and right borders' do
                  it 'do not create a frame' do

                  end
                end
              end
              context 'on all four borders' do
                it 'do not create a frame' do

                end
              end
            end
          end
        end
        context 'touching another frame' do
          context 'touching only one frame' do
            context 'when the other frame is on the top' do
              it 'do not create a frame' do
  
              end
            end
            context 'when the other frame is on the right' do
              it 'do not create a frame' do
  
              end
            end
            context 'when the other frame is on the bottom' do
              it 'do not create a frame' do
  
              end
            end
            context 'when the other frame is on the left' do
              it 'do not create a frame' do
  
              end
            end
          end
          context 'touching multiple frames' do
            context 'when the other frames are on the same border' do
              context 'on the top' do
                it 'do not create a frame' do
    
                end
              end
              context 'on the right' do
                it 'do not create a frame' do
    
                end
              end
              context 'on the bottom' do
                it 'do not create a frame' do
    
                end
              end
              context 'on the left' do
                it 'do not create a frame' do
    
                end
              end
            end
            context 'when the other frames are on diferent borders' do
              context 'on two borders' do
                context 'for the top and right borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the right and bottom borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the bottom and left borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the left and top borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the top and bottom borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the left and right borders' do
                  it 'do not create a frame' do

                  end
                end
              end
              context 'on three borders' do
                context 'for the top, right and bottom borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the right, bottom and left borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the bottom, left and top borders' do
                  it 'do not create a frame' do

                  end
                end
                context 'for the left, top and right borders' do
                  it 'do not create a frame' do

                  end
                end
              end
              context 'on all four borders' do
                it 'do not create a frame' do

                end
              end
            end
          end
        end
      end
    end
  end
end
