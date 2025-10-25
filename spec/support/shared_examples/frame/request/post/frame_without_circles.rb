RSpec.shared_examples 'a frame with no circles within' do
  include_examples 'a POST response with a frame'

  it 'returns no circles within' do
    expect(json['circles']).to be_nil
  end
end