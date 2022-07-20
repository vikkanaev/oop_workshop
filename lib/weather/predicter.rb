# frozen_string_literal: true

module Weather
  class Predicter
    # NOTE: Хотя в задании и написано "в конструктор передаются координаты"
    # Но делать я так не готов, потому что связанность такого кода получается очень высокой
    # Вместо этого я буду передавать настроенный экземпляр репортера
    def initialize(reporter:, predict_stratagy: :average)
      @reporter = reporter
      @predict_stratagy = predict_stratagy
    end

    def predict(date:)
      send("#{@predict_stratagy}_stratagy".to_sym, date:)
    end

    private

    def average_stratagy(date:)
      data = @reporter.batch_report(dates: ten_years_dates(date:))
      data.values.sum(0.0) / data.size
    end

    def ten_years_dates(date:)
      start = Date.parse(date)
      array = Array.new(10)
      array.each_with_index { |_x, i| array[i] = start - (i + 1).years }.map(&:iso8601)
    end
  end
end
