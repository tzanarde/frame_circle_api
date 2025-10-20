RSpec::Matchers.define :not_create_circle_and_return_error do |error_key|
  match do |creating_circle|
    expect { creating_circle.save }.not_to change(Circle, :count)
    creating_circle.errors.full_messages.include?(t(error_key))
  end
end
