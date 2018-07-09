# frozen_string_literal: true

module SuperOffice
  module Endpoints
    module List
      module Task
        def task_mdo_items
          SuperOffice::Result.new(data: get('/List/Task/MDOItems'))
        end
      end
    end
  end
end
