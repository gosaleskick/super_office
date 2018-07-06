# frozen_string_literal: true

module SuperOffice
  class Result
    attr_reader :data

    def initialize(data:)
      @data = data
    end
  end
end
