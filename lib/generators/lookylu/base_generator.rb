include ActionView::Helpers::TextHelper

module Lookylu
  module Generators
    class BaseGenerator < Rails::Generators::Base

      argument :object_name, type: :string, default: 'state'

      def file_name
        object_name.underscore
      end

      def model_name
        file_name.camelize
      end

      def plural_name
        file_name.pluralize
      end

      def plural_model_name
        model_name.pluralize
      end


    end
  end
end