RSpec.shared_examples 'a frame deleted' do
  it 'deletes a frame' do
    expect(Frame.find_by(id: id)).to be_nil
  end
end
