# frozen_string_literal: true

module SuperOffice
  module Endpoints
    module Archive
      module Sale
        def sale(**params)
          SuperOffice::Result.new(data: get('/Archive/Sale', **formatted_params(params)))
        end
      end
    end
  end
end
