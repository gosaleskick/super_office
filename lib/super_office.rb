# frozen_string_literal: true

require "super_office/version"
require 'typhoeus'
require 'oj'
require 'rbnacl/libsodium'
require 'jwt'

require 'super_office/configuration'
require 'super_office/connection'
require 'super_office/encryptor'
require 'super_office/result'
require 'super_office/endpoints/archive/internal_users'
require 'super_office/oauth/client'
require 'super_office/oauth/token/base'
require 'super_office/oauth/token/fetcher'
require 'super_office/oauth/token/refresher'

module SuperOffice
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
