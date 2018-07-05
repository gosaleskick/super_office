# frozen_string_literal: true

module SuperOffice
  module OAuth
    module Token
      class Fetcher < Base
        class FetchTokenError < StandardError; end

        def initialize(code)
          @code = code
        end

        def fetch
          raise FetchTokenError, response_body[:error_description] if response_body.fetch(:error, false)

          token_attributes
        end

        private

        attr_reader :code

        def response
          @response ||= post_request(:authorization_code, { code: code })
        end
      end
    end
  end
end
