RSpec.shared_examples 'an invalid circle' do |error_message|
  it 'does not create a circle' do
    expect { circle_to_add.save }.not_to change(Circle, :count)
  end
  
  it 'has validation error' do
    circle_to_add.save
    expect(circle_to_add.errors.full_messages).to include(t("messages.error.#{error_message}"))
  end
end

RSpec.shared_examples 'an invalid circle overlapping a frame' do
  include_context 'an invalid circle', :circle_overlap_the_frame
end

RSpec.shared_examples 'an invalid circle overlapping or touching another circle' do
  include_context 'an invalid circle', :circle_overlap_or_touch_an_existing_circle
end

RSpec.shared_examples 'an invalid circle overlapping or touching other circles' do
  it 'does not create the circles' do
    expect { circle_to_add.save }.not_to change(Circle, :count)
    expect { second_circle_to_add.save }.not_to change(Circle, :count)
  end

  it 'has validation errors' do
    circle_to_add.save
    second_circle_to_add.save
    expect(circle_to_add.errors.full_messages).to include(t('messages.error.circle_overlap_or_touch_an_existing_circle'))
    expect(second_circle_to_add.errors.full_messages).to include(t('messages.error.circle_overlap_or_touch_an_existing_circle'))
  end
end
