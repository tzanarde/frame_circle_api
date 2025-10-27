RSpec.shared_examples 'a circle updated' do |frame|
  let!(:json) { JSON.parse(response.body) }

  it 'is placed within the correct frame' do
    expect(json['frame_id']).to eq(public_send(frame).id)
  end

  it 'has the correct values' do
    expect(json['center_x'].to_f).to eq(circle_params[:circle][:center_x])
    expect(json['center_y'].to_f).to eq(circle_params[:circle][:center_y])
    expect(json['diameter'].to_f).to eq(circle_params[:circle][:diameter])
  end
end

RSpec.shared_examples 'a circle frame updated' do |frame|
  include_context 'a circle updated', frame
end

RSpec.shared_examples 'a circle position updated' do |frame|
  include_context 'a circle updated', frame
end

RSpec.shared_examples 'a circle position not updated because of an overlapping' do
  let!(:json) { JSON.parse(response.body) }

  it 'does not update the circle position' do
    circle_not_updated = Circle.find(first_existing_frame.circles[3].id)

    expect(circle_not_updated.center_x).to eq(first_existing_frame.circles[3][:center_x])
    expect(circle_not_updated.center_y).to eq(first_existing_frame.circles[3][:center_y])
    expect(circle_not_updated.diameter).to eq(first_existing_frame.circles[3][:diameter])
  end

  it 'has validation error' do
    expect(json['errors']).to include(t('messages.error.circle_overlap_or_touch_an_existing_circle'))
  end
end

RSpec.shared_examples 'a circle position not updated because of a circle overlapping' do  |error_message|
  include_context 'a circle position not updated because of an overlapping', :circle_overlap_or_touch_an_existing_circle
end

RSpec.shared_examples 'a circle position not updated because of a frame overlapping' do |error_message|
  include_context 'a circle position not updated because of an overlapping', :circle_overlap_the_frame
end

RSpec.shared_examples 'a circle position not updated because of an invalid frame' do
  let!(:json) { JSON.parse(response.body) }

  it 'does not update the circle frame' do
    circle_not_updated = Circle.find(first_existing_frame.circles[3].id)

    expect(circle_not_updated.frame_id).to eq(first_existing_frame.circles[3][:frame_id])
  end
end
