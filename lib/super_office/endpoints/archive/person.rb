# frozen_string_literal: true

module SuperOffice
  module Endpoints
    module Archive
      module Person
        def person(**params)
          formatted_params = {}
          formatted_params[:$select] = params[:select] if params[:select]
          formatted_params[:$filter] = params[:filter] if params[:filter]

          SuperOffice::Result.new(data: get('/Archive/Person', **formatted_params))
        end
      end
    end
  end
end
