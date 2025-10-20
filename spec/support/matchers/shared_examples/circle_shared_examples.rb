RSpec.shared_examples 'a valid circle on a frame' do
  it 'creates a circle' do
    expect(circle_to_add).to be_valid.and be_persisted

    expect(circle_to_add.errors).to be_empty

    expect(circle_to_add.frame).to eq(frame)

    expect(circle_to_add.center_x).to eq(attributes_for_circle_to_add[:center_x])
    expect(circle_to_add.center_y).to eq(attributes_for_circle_to_add[:center_y])
    expect(circle_to_add.diameter).to eq(attributes_for_circle_to_add[:diameter])
  end
end

RSpec.shared_examples 'an invalid circle overlapping a frame border and returning error' do |border|
  it "does not create a circle and returns the correct error for the #{border} border" do
    expect(circle_to_add)
      .to not_create_circle_and_return_error("messages.error.circle_overlap_the_#{border}_frame")
  end
end

RSpec.shared_examples 'an invalid circle overlapping multiple frame borders and returning error' do
  it 'does not create a circle and returns the correct error' do
    expect(circle_to_add)
      .to not_create_circle_and_return_error('messages.error.circle_overlap_multiple_frame_borders')
  end
end

RSpec.shared_examples 'an invalid circle out of the frame and returning error' do |border|
  it "does not create a circle and returns the correct error" do
    expect(circle_to_add)
      .to not_create_circle_and_return_error("messages.error.circle_out_of_the_frame")
  end
end

RSpec.shared_examples 'an invalid circle overlapping or touching an existing circle and returning error' do
  it "does not create a circle and returns the correct error" do
    expect(circle_to_add)
      .to not_create_circle_and_return_error("messages.error.circle_overlap_or_touch_an_existing_circle")
  end
end

RSpec.shared_examples 'an invalid circle overlapping or touching multiple existing circles and returning error' do
  it "does not create a circle and returns the correct error" do
    expect(circle_to_add)
      .to not_create_circle_and_return_error("messages.error.circle_overlap_or_touch_multiple_existing_circles")
  end
end
