# frozen_string_literal: true

module SuperOffice
  module OAuth
    class Client
      include SuperOffice::Endpoints::Archive::Appointment
      include SuperOffice::Endpoints::Archive::InternalUsers
      include SuperOffice::Endpoints::Archive::Person
      include SuperOffice::Endpoints::Archive::Sale
      include SuperOffice::Endpoints::List::Task
      include SuperOffice::ParamsFormatter
      include SuperOffice::Connection

      def initialize(token:)
        @token = token
      end

      private

      attr_reader :token
    end
  end
end
