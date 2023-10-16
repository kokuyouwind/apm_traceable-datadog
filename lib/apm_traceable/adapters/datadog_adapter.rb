# frozen_string_literal: true

require 'active_support/inflector'
require 'datadog/tracing'

module ApmTraceable
  module Adapters
    # Datadogへトレース結果を送るためのアダプター
    class DatadogAdapter
      def initialize(service_name:)
        super()

        @service_name = service_name
      end

      def trace(trace_name, context_class:, **options, &block)
        ::Datadog::Tracing.trace(
          trace_name,
          **options.merge(service: service_name, resource: resource_name(context_class)),
          &block
        )
      end

      private

      attr_reader :service_name

      def resource_name(context_class)
        # include 先のクラス名を利用して `admin.users_controller` のような文字列を作る
        (context_class&.name || 'UnknownClass').underscore&.tr('/', '.')
      end
    end
  end
end
