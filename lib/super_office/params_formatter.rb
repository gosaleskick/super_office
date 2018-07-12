# frozen_string_literal: true

module SuperOffice
  module ParamsFormatter
    def formatted_params(params)
      formatted_params = params.dup
      formatted_params[:$select] = formatted_params.delete(:select) if formatted_params[:select]
      formatted_params[:$filter] = formatted_params.delete(:filter) if formatted_params[:filter]

      formatted_params
    end
  end
end
