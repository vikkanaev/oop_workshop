# frozen_string_literal: true

module Weather
  class Reporter
    # NOTE: Хотя в задании и написано "в конструктор передаются координаты"
    # Но это место вызывает большие вопросы, потому как связанность такого кода получается очень высокой
    # Для меня назначение данного класса не очевидно. Я бы предпочел от него избавится,
    # что бы Predicter сразу работал с клиентами данных.
    def initialize(place:, datasource_class:, unit: :metric, **args)
      @place = place
      @datasource_class = datasource_class
      @unit = unit
      @args = args
    end

    def report(date:)
      datasource_client.report(date:)
    end

    def batch_report(dates:)
      datasource_client.batch_report(dates:)
    end

    private

    def datasource_client
      @datasource_client ||= @datasource_class.new(place: @place, unit: @unit, **@args)
    end
  end
end
