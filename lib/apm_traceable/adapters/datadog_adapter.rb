# frozen_string_literal: true

require 'active_support/inflector'
require 'concurrent/map'
require 'datadog/tracing'

module ApmTraceable
  module Adapters
    # Datadogへトレース結果を送るためのアダプター
    class DatadogAdapter
      RESOURCE_NAME_CACHE = Concurrent::Map.new
      UNKNOWN_CLASS_NAME  = 'unknown_class'

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
        key = context_class&.name

        return UNKNOWN_CLASS_NAME unless key

        # Concurrent::Mapを使い、既に生成済みのリソース名に関しては処理をスキップ
        RESOURCE_NAME_CACHE.compute_if_absent(key) do
          # include 先のクラス名を利用して `admin.users_controller` のような文字列を作る
          key.underscore.tr('/', '.').freeze
        end
      end
    end
  end
end
