RSpec.shared_examples 'an invalid frame' do
  it 'does not create a frame' do
    expect { frame_to_add.save }.not_to change(Frame, :count)
  end

  it 'has validation error' do
    frame_to_add.save
    expect(frame_to_add.errors.full_messages).to include(t("messages.error.frame_overlap_or_touch_an_existing_frame"))
  end
end
