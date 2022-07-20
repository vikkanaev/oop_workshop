# frozen_string_literal: true

module Datasource
  class Base
    # Принимает точку, единицу измерения и необязательные аргументы. Возвращает клиент датасорца
    def initialize(place:, unit:, **args)
      @place = place
      @unit = unit
      @args = args
    end

    # Принимает дату. Возвращает температуру
    def report(date:)
      raise NotImplementedError
    end

    # Принимает масив дад. Возвращает хеш дата => температура
    def batch_report(dates:)
      raise NotImplementedError
    end
  end
end
