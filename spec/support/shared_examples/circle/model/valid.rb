RSpec.shared_examples 'a valid circle on a frame' do
  before { circle_to_add.save }

  it 'creates a circle' do
    expect(circle_to_add).to be_valid.and be_persisted
  end

  it 'has no validation errors' do
    expect(circle_to_add.errors).to be_empty
  end

  it 'is placed within the correct frame' do
    expect(circle_to_add.frame).to eq(existing_frame)
  end

  it 'has the correct values' do
    expect(circle_to_add.center_x).to eq(attributes_for_circle_to_add[:center_x])
    expect(circle_to_add.center_y).to eq(attributes_for_circle_to_add[:center_y])
    expect(circle_to_add.diameter).to eq(attributes_for_circle_to_add[:diameter])
  end
end

RSpec.shared_examples 'circles in an area' do
  it 'has the correct amount of circles' do
    expect(circles_returned.count).to eq(circles_expected.count)
  end

  it 'has the correct circles' do
    expected_circles_ids = circles_expected.map { |circle| circle[:id] }
    returned_circles_ids = circles_returned.map { |circle| circle[:id] }

    expect(returned_circles_ids).to match_array(expected_circles_ids)
  end
end

RSpec.shared_examples 'all circles from a frame' do
  let!(:circles_expected) { first_existing_frame.circles }
  let!(:circles_returned) { Circle.by_frame(first_existing_frame.id) }

  include_context 'circles in an area'
end

RSpec.shared_examples 'an area with all circles from a frame' do
  let!(:circles_expected) { first_existing_frame.circles }
  let!(:circles_returned) { Circle.circles_within_area(9.0, 9.0, 8.0) }

  include_context 'circles in an area'
end

RSpec.shared_examples 'an area with circles from all the frames reached' do
  let!(:circles_expected) { first_existing_frame.circles.to_a + second_existing_frame.circles.to_a[0..1] }
  let!(:circles_returned) { Circle.circles_within_area(14.0, 12.0, 12.0) }

  include_context 'circles in an area'
end

RSpec.shared_examples 'an area with some circles from a frame' do
  let!(:circles_expected) { first_existing_frame.circles.to_a[1..3] }
  let!(:circles_returned) { Circle.circles_within_area(8.0, 9.0, 5.0) }

  include_context 'circles in an area'
end

RSpec.shared_examples 'a not existing frame returning no circles' do
  let!(:circles_within_frame_expected) { [] }
  let!(:circles_within_frame_returned) { Circle.by_frame(99999) }

  it 'has no circles' do
    expect(circles_within_frame_returned).to eq(circles_within_frame_expected)
  end
end

RSpec.shared_examples 'an area with no circles' do
  let!(:circles_within_area_expected) { first_existing_frame.circles }
  let!(:circles_within_area_returned) { Circle.circles_within_area(14.0, 20.0, 6.0) }

  it 'has no circles' do
    expect(circles_within_area_returned.count).to eq(0)
  end
end