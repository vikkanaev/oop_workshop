# frozen_string_literal: true

RSpec.describe Weather::Predicter do
  let(:place) { Poro::Place.new(latitude: 1, longitude: 2) }
  let(:datasource_class) { Datasource::FakeClient }
  let(:data) do
    {
      '2021-08-01' => 23,
      '2020-08-01' => 23,
      '2019-08-01' => 23,
      '2018-08-01' => 23,
      '2017-08-01' => 23,
      '2016-08-01' => 21,
      '2015-08-01' => 21,
      '2014-08-01' => 21,
      '2013-08-01' => 21,
      '2012-08-01' => 21
    }
  end
  let(:params) { { place:, datasource_class:, unit: :metric, data: } }
  let(:reporter) { Weather::Reporter.new(**params) }

  subject { described_class.new(reporter:) }

  describe '#predict' do
    it 'returns the temperature predict for the given date' do
      expect(subject.predict(date: '2022-08-01')).to eq(22.0)
    end
  end
end
