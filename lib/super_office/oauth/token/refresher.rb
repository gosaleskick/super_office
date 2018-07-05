# frozen_string_literal: true

module SuperOffice
  module OAuth
    module Token
      class Refresher < Base
        class RefreshError < StandardError; end

        SAFE_REQUEST_MARGIN_IN_SECONDS = 10

        class << self
          def should_refresh?(token)
            token.expires_at <= Time.now.utc - SAFE_REQUEST_MARGIN_IN_SECONDS
          end
        end

        def initialize(token)
          @token = token
        end

        def refresh
          raise RefreshError, response_body[:error] if response_body.fetch(:error, false)

          token.update(token_attributes)
          token
        end

        private

        attr_reader :token

        def response
          @response ||= post_request(:refresh_token, { refresh_token: refresh_token })
        end

        def refresh_token
          SuperOffice::Encryptor.decrypt(encrypted_refresh_token)
        end

        def encrypted_refresh_token
          @encrypted_refresh_token ||= token.encrypted_refresh_token
        end
      end
    end
  end
end
