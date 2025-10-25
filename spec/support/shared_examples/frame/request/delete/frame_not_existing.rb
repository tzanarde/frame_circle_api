RSpec.shared_examples 'a not existing frame' do
  it 'checks that the frame does not exist' do
    expect(Frame.find_by(id: id)).to be_nil
  end
end