# frozen_string_literal: true

module SuperOffice
  module Endpoints
    module Archive
      module InternalUsers
        def internal_users
          SuperOffice::Result.new(data: get('/Archive/InternalUsers'))
        end
      end
    end
  end
end
