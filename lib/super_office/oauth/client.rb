# frozen_string_literal: true

module SuperOffice
  module OAuth
    class Client
      include SuperOffice::Endpoints::Archive::InternalUsers
      include SuperOffice::Connection

      def initialize(token:)
        @token = token
      end

      private

      attr_reader :token
    end
  end
end
