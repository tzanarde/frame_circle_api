RSpec.shared_examples 'a circle deleted' do
  it 'deletes a circle' do
    expect(Circle.find_by(id: id)).to be_nil
  end
end

RSpec.shared_examples 'a not existing circle' do
  it 'checks that the circle does not exist' do
    expect(Circle.find_by(id: id)).to be_nil
  end
end
