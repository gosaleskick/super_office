# frozen_string_literal: true

require 'spec_helper'

describe SuperOffice::Result do
  describe '#data' do
    it 'returns data' do
      result = SuperOffice::Result.new(data: 'new_data')

      expect(result.data).to eq 'new_data'
    end
  end
end
