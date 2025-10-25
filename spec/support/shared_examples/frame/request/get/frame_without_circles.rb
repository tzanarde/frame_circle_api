RSpec.shared_examples 'a response with a frame with no circles within' do
  include_examples 'a GET response with a frame'

  it 'returns no circles within' do
    expect(json['circles']).to be_nil
  end
end