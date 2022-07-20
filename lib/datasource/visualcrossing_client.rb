# frozen_string_literal: true

module Datasource
  class VisualcrossingClient < Base
    URI = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/'
    KEY = ENV.fetch('WEATHER_API_KEY')

    def initialize(place:, unit: :metric)
      @place = place
      @unit = unit
      super
    end

    def report(date:)
      fetch_data(date)[date]
    end

    def batch_report(dates:)
      dates.map { |date| fetch_data(date) }.reduce({}, :merge)
    end

    private

    def fetch_data(date)
      uri = URI + "#{@place}/#{date}?unitGroup=#{@unit}&include=days&key=#{KEY}"
      response = Faraday.get(uri)
      return {} unless response.success?

      d = JSON.parse(response.body).deep_symbolize_keys[:days].first
      { d[:datetime] => d[:temp] }
    end
  end
end
