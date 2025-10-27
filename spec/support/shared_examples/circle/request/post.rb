RSpec.shared_examples 'a circle created within the frame' do
  let!(:json) { JSON.parse(response.body) }

  it 'is placed within the correct frame' do
    expect(json['frame_id']).to eq(existing_frame.id)
  end

  it 'has the correct values' do
    expect(json['center_x'].to_f).to eq(circle_params[:circle][:center_x])
    expect(json['center_y'].to_f).to eq(circle_params[:circle][:center_y])
    expect(json['diameter'].to_f).to eq(circle_params[:circle][:diameter])
  end
end

RSpec.shared_examples 'a circle not created' do
  it 'does not create the circle' do
    expect(Circle.all.count).to eq(0)
  end
end

RSpec.shared_examples 'a circle not created because of an overlapping' do |center_x, center_y, diameter, error_message|
  let!(:json) { JSON.parse(response.body) }

  it 'does not create the circle' do
    circle_not_created = Circle.where(center_x: center_x, center_y: center_y, diameter: diameter)

    expect(circle_not_created.count).to eq(0)
  end

  it 'has validation error' do
    expect(json['errors']).to include(t("messages.error.#{error_message}"))
  end
end

RSpec.shared_examples 'a circle not created because of a circle overlapping' do
  include_context 'a circle not created because of an overlapping', 13.0, 8.0, 4.0, :circle_overlap_or_touch_an_existing_circle
end

RSpec.shared_examples 'a circle not created because of a frame overlapping' do
  include_context 'a circle not created because of an overlapping', 8.0, 11.0, 2.0, :circle_overlap_the_frame
end
