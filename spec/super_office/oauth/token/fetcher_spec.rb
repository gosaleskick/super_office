# frozen_string_literal: true

require 'spec_helper'

describe SuperOffice::OAuth::Token::Fetcher do
  describe '#fetch' do
    let(:instance) { described_class.new(code) }

    context 'invalid token' do
      let(:code) { 'invalid_code' }

      it 'raises an error', :vcr do
        expect { instance.fetch }
          .to raise_error SuperOffice::OAuth::Token::Fetcher::FetchTokenError, "Invalid client_id/client_secret/authorization_code"
      end
    end

    context 'valid token' do
      let(:code) { 'code' }

      subject { instance.fetch }

      it 'returns hash with token attributes', :vcr do
        expect(subject).to match(
          encrypted_access_token: be_a(String),
          encrypted_refresh_token: be_a(String),
          expires_at: Time.parse('Wed, 04 Jul 2018 10:31:12 GMT'),
          api_endpoint: 'https://sod.superoffice.com/Cust25708/api/'
        )
        expect(SuperOffice::Encryptor.decrypt(subject[:encrypted_access_token])).to eq('access_token')
        expect(SuperOffice::Encryptor.decrypt(subject[:encrypted_refresh_token])).to eq('refresh_token')
      end
    end
  end
end
