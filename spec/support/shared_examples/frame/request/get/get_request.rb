RSpec.shared_examples 'a GET response with a frame' do
  it 'returns one frame' do
    expect(json).to be_a(Hash)
  end

  include_examples 'a base frame response'
end
