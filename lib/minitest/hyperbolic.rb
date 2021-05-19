# frozen_string_literal: true

require "json"
require_relative "hyperbolic/version"

module Minitest
  module Reporters
    class HyperbolicReporter < Minitest::StatisticsReporter
      def record(result)
        super

        results << result if result.passed?
      end

      def json
        results.map do |result|
            result_hash = {}
            result_hash[:name] = result.name
            result_hash[:passed] = result.passed?
            result_hash[:failures] = result.failures.map(&:to_s) unless result.failures.empty?
            result_hash
        end.to_json
      end

      def report
        super

        io.puts json
      end

      def before_test(*args); end
      def after_test(*args); end
    end
  end
end
