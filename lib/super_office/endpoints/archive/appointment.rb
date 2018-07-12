# frozen_string_literal: true

module SuperOffice
  module Endpoints
    module Archive
      module Appointment
        def appointment(**params)
          SuperOffice::Result.new(data: get('/Archive/Appointment', **formatted_params(params)))
        end
      end
    end
  end
end
