# frozen_string_literal: true

module Poro
  class Place
    attr_reader :latitude, :longitude

    def initialize(latitude:, longitude:)
      @latitude = latitude
      @longitude = longitude
    end

    def to_s
      "#{latitude}%2C%20#{longitude}"
    end
  end
end
