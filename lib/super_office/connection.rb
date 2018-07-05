# frozen_string_literal: true

module SuperOffice
  module Connection
    class MissingParameter < StandardError; end

    API_VERSION = :v1

    private

    def get(endpoint_path, **params)
      request(:get, endpoint_path, params)
    end

    def request(method, endpoint_path, **params)
      body = method == :get ? nil : Oj.dump(params, mode: :compat)
      params = body ? nil : params

      refresh_token

      response = Typhoeus::Request.new(
        endpoint(endpoint_path),
        method: method,
        body: body,
        params: params,
        headers: {
          'Accept' => 'application/json',
          'Authorization' => "Bearer #{access_token}"
        }
      ).run

      Oj.load(response.response_body, symbol_keys: true, mode: :strict)
    end

    def endpoint(endpoint_path)
      "#{token.api_endpoint}#{API_VERSION}#{endpoint_path}"
    end

    def access_token
      SuperOffice::Encryptor.decrypt(token.encrypted_access_token)
    end

    def refresh_token
      return unless SuperOffice::OAuth::Token::Refresher.should_refresh?(token)

      @token = SuperOffice::OAuth::Token::Refresher.new(token).refresh
    end
  end
end
