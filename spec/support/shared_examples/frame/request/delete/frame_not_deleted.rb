RSpec.shared_examples 'a frame not deleted' do
  it 'does not delete a frame' do
    expect(Frame.exists?(id)).to be(true)
  end
end