RSpec.shared_examples 'a POST response with a frame' do
  it 'creates one frame' do
    expect(Frame.count).to eq(1)
  end

  include_examples 'a base frame response'
end
