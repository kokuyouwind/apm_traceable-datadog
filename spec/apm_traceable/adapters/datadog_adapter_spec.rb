# frozen_string_literal: true

class TracerTestClass
  include ApmTraceable::Tracer

  trace_methods :test_trace_method
  def test_trace_method
    'test'
  end
end

RSpec.describe ApmTraceable::Adapters::DatadogAdapter do
  let(:test_object) { TracerTestClass.new }

  before do
    ApmTraceable.configure do |config|
      config.adapter = 'datadog', { service_name: 'test_service' }
    end
  end

  describe '#trace_methods' do
    it '適切な引数で Datadog::Tracing.trace を呼び出す' do
      allow(Datadog::Tracing).to receive(:trace) { |_, &block| block.call }
      expect(test_object.test_trace_method).to eq 'test'
      expect(Datadog::Tracing).to have_received(:trace).with(
        'test_trace_method',
        service: 'test_service',
        resource: 'tracer_test_class'
      )
    end
  end

  describe '#trace_span' do
    it '適切な引数で Datadog::Tracing.trace を呼び出す' do
      allow(Datadog::Tracing).to receive(:trace) { |_, &block| block.call }
      expect(test_object.trace_span('test_name', option1: :value1) { 'test' }).to eq 'test'
      expect(Datadog::Tracing).to have_received(:trace).with(
        'test_name',
        service: 'test_service',
        resource: 'tracer_test_class',
        option1: :value1
      )
    end
  end
end
