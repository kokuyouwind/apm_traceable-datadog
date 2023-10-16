# frozen_string_literal: true

RSpec.describe ApmTraceable::Datadog do
  it 'has a version number' do
    expect(ApmTraceable::Datadog::VERSION).not_to be_nil
  end
end
