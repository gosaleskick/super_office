# frozen_string_literal: true

module SuperOffice
  module Endpoints
    module Archive
      module Person
        def person(**params)
          SuperOffice::Result.new(data: get('/Archive/Person', **formatted_params(params)))
        end
      end
    end
  end
end
