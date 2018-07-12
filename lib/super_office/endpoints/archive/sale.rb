# frozen_string_literal: true

module SuperOffice
  module Endpoints
    module Archive
      module Sale
        def sale(**params)
          formatted_params = {}
          formatted_params[:$select] = params[:select] if params[:select]
          formatted_params[:$filter] = params[:filter] if params[:filter]

          SuperOffice::Result.new(data: get('/Archive/Sale', **formatted_params))
        end
      end
    end
  end
end
