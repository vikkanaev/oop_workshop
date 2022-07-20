# frozen_string_literal: true

RSpec.describe IceCreamFactory do
  let(:predicter) { double(predict: predicted_result) }
  let(:input) { { date: '2018-01-01', quantity: 10 } }

  subject { described_class.new(predicter:).produce(**input) }

  context 'when the temperature is above 30' do
    let(:predicted_result) { 31 }

    it { expect(subject.size).to eq(15) }
    it { expect(subject).to all(be_a(Poro::FoilPackage)) }
  end

  context 'when the temperature is below 10' do
    let(:predicted_result) { 9 }

    it { expect(subject.size).to eq(5) }
    it { expect(subject).to all(be_a(Poro::FoilPackage)) }
  end

  context 'when the temperature is between 10 and 30' do
    let(:predicted_result) { 20 }

    it { expect(subject.size).to eq(10) }
    it { expect(subject).to all(be_a(Poro::FoilPackage)) }
  end
end
