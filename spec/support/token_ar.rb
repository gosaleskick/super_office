# frozen_string_literal: true

class TokenAR
  # decrypted string: access_token
  ENCRYPTED_ACCESS_TOKEN = "\xEB\x0EZZ>\xFC,T\xF0\xE0\xD7Y\x99\xAD\xE4\xACu^\x10\x1E@\x86L\xEE^\xA6\x96R\xD3I\x95y\x8D\x97\xC79\x1E\xA3\xF4\xB3\xC99\x9C\xC42\v\x90?\n\xB6|\x8B"
  # decrypted string: refresh_token
  ENCRYPTED_REFRESH_TOKEN =  "%\x99HT\tMX\x01\xE6S\xCF\x14\xDBL8\xF2\x84\xB2&+\x8B\xDD\x95\xA76\xBC \xF7\xB3T\x04\xF1\xE0\xE5\xC6\xC7\xD8\xAA\x896\xD4h\xC0\r0r\x12\xAA]\xC7S\x95$"

  attr_reader :encrypted_access_token, :encrypted_refresh_token, :expires_at, :api_endpoint

  def initialize(encrypted_access_token: nil, encrypted_refresh_token: nil, expires_at: nil, api_endpoint: nil)
    @encrypted_access_token = encrypted_access_token || ENCRYPTED_ACCESS_TOKEN
    @encrypted_refresh_token = encrypted_refresh_token || ENCRYPTED_REFRESH_TOKEN
    @expires_at = expires_at || Date.parse('2050-01-01').to_time
    @api_endpoint = api_endpoint || 'https://sod.superoffice.com/Cust25708/api/'
  end

  def update(encrypted_access_token:, encrypted_refresh_token:, expires_at:, api_endpoint:)
    @encrypted_access_token = encrypted_access_token
    @encrypted_refresh_token = encrypted_refresh_token
    @expires_at = expires_at
    @api_endpoint = api_endpoint

    true
  end
end
