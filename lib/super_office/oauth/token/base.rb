# frozen_string_literal: true

module SuperOffice
  module OAuth
    module Token
      class Base
        JWT_API_ENDPOINT_KEY = 'http://schemes.superoffice.net/identity/webapi_url'

        private

        def token_attributes
          {
            api_endpoint: api_endpoint,
            encrypted_access_token: SuperOffice::Encryptor.encrypt(response_body[:access_token]),
            encrypted_refresh_token: encrypted_refresh_token,
            expires_at: expires_at
          }
        end

        def expires_at
          @expires_at ||= Time.parse(response.headers['date']) + response_body[:expires_in].to_i
        end

        def api_endpoint
          JWT.decode(response_body[:id_token], nil, false).first[JWT_API_ENDPOINT_KEY]
        end

        def encrypted_refresh_token
          SuperOffice::Encryptor.encrypt(response_body[:refresh_token])
        end

        def response
          raise NotImplementedError
        end

        def post_request(grant_type, params)
          Typhoeus::Request.post(
            token_request_url,
            body: {
              grant_type: grant_type,
              client_id: SuperOffice.configuration.client_id,
              client_secret: SuperOffice.configuration.client_secret,
              redirect_uri: SuperOffice.configuration.redirect_uri
            }.merge!(params),
            headers: {
              'Content-Type' => 'application/x-www-form-urlencoded'
            }
          )
        end

        def token_request_url
          "https://#{SuperOffice.configuration.subdomain}.superoffice.com/login/common/oauth/tokens"
        end

        def response_body
          @response_body ||= Oj.load(response.response_body, symbol_keys: true)
        end
      end
    end
  end
end
