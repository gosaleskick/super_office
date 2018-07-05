# frozen_string_literal: true

module SuperOffice
  class Configuration
    ENVIRONMENT_SUBDOMAINS = {
      development: :sod,
      production: :online,
      stage: :qaonline
    }.freeze

    attr_accessor :client_id, :client_secret, :redirect_uri, :secret_encryption_key, :environment

    def initialize
      @client_id = nil
      @client_secret = nil
      @redirect_uri = nil
      @secret_encryption_key = nil
      @environment = nil
    end

    def subdomain
      ENVIRONMENT_SUBDOMAINS[environment]
    end
  end
end
