# frozen_string_literal: true

RSpec.describe Weather::Reporter do
  let(:place) { Poro::Place.new(latitude: 1, longitude: 2) }
  let(:datasource_class) { Datasource::FakeClient }
  let(:data) { { '2018-01-01' => 20, '2019-01-01' => 21, '2020-01-01' => 22, '2021-01-01' => 23, '2022-01-01' => 20 } }
  let(:params) { { place:, datasource_class:, unit: :metric, data: } }

  subject { described_class.new(**params) }

  describe '#report' do
    it 'returns the temperature for the given date' do
      expect(subject.report(date: '2018-01-01')).to eq(20)
    end
  end

  describe '#batch_report' do
    it 'returns the temperature for the given date' do
      expect(subject.batch_report(dates: %w(2018-01-01 2019-01-01))).to eq({ '2018-01-01' => 20, '2019-01-01' => 21 })
    end
  end
end
