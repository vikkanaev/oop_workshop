# frozen_string_literal: true

module Poro
  class FoilPackage
    attr_reader :created_at

    def initialize
      @created_at = Time.now
    end
  end
end
