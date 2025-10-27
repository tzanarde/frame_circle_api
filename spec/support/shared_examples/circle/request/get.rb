RSpec.shared_examples 'a response with circles within an area' do |circles_expected|
  let!(:json) { JSON.parse(response.body) }

  it 'has the correct amount of circles' do
    expect(json.count).to eq(public_send(circles_expected).count)
  end

  it 'has the correct circles' do
    expected_circles_ids = public_send(circles_expected).map { |circle| circle[:id] }
    json_ids = json.map { |circle| circle['id'] }

    expect(json_ids).to match_array(expected_circles_ids)
  end
end

RSpec.shared_examples 'a response with circles within an area for an specific frame' do
  let!(:circles_expected) { first_existing_frame.circles }

  include_context 'a response with circles within an area', :circles_expected
end

RSpec.shared_examples 'a response with circles within an area for all frames' do
  let!(:circles_expected) { first_existing_frame.circles.to_a + second_existing_frame.circles.to_a[0..1] }

  include_context 'a response with circles within an area', :circles_expected
end

RSpec.shared_examples 'a response with no circles' do
  let!(:json) { JSON.parse(response.body) }

  it 'has the correct amount of circles' do
    expect(json.count).to eq(0)
  end
end
