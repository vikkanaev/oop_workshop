# frozen_string_literal: true

module Datasource
  class FakeClient < Base
    def initialize(place:, unit:, **args)
      @data = args[:data]
      super
    end

    def report(date:)
      @data[date]
    end

    def batch_report(dates:)
      dates.each_with_object({}) { |date, memo| memo[date] = @data[date] }
    end
  end
end
