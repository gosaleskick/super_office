# frozen_string_literal: true

require 'spec_helper'

describe SuperOffice::Configuration do
  let(:instance) { described_class.new }

  describe '#subdomain' do
    subject { instance.subdomain }

    context 'development' do
      it 'returns sod' do
        instance.environment = :development

        expect(subject).to eq(:sod)
      end
    end

    context 'stage' do
      it 'returns qaonline' do
        instance.environment = :stage

        expect(subject).to eq(:qaonline)
      end
    end

    context 'production' do
      it 'returns online' do
        instance.environment = :production

        expect(subject).to eq(:online)
      end
    end

    context 'unknown' do
      it 'returns nil' do
        instance.environment = :unknown

        expect(subject).to eq(nil)
      end
    end
  end
end
