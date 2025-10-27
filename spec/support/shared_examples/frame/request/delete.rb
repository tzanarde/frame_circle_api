RSpec.shared_examples 'a frame deleted' do
  it 'deletes a frame' do
    expect(Frame.find_by(id: id)).to be_nil
  end
end

RSpec.shared_examples 'a frame not deleted' do
  it 'does not delete a frame' do
    expect(Frame.exists?(id)).to be(true)
  end
end

RSpec.shared_examples 'a not existing frame' do
  it 'checks that the frame does not exist' do
    expect(Frame.find_by(id: id)).to be_nil
  end
end