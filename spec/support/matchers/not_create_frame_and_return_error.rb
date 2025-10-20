RSpec::Matchers.define :not_create_frame_and_return_error do |error_key|
  match do |creating_frame|
    expect { creating_frame.save }.not_to change(Frame, :count)
    creating_frame.errors.full_messages.include?(t(error_key))
  end
end
