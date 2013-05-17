require 'data/lu/states'
require 'generators/lookylu/base_generator'

module Lookylu
  module Generators
    class StateDataGenerator < Lookylu::Generators::BaseGenerator
      argument :country_name, :type => :string, :default => 'US', :desc => "Choose a country: us(United States), ca(Canada), or all."

      def populate_data
        connect_to_db
        unless ActiveRecord::Base.connection.table_exists? plural_name
          raise "Table #{plural_name} does not exist. Please build the needed migration and migrate your database"
        end
        begin
          class_object = eval(object_name)

          LookyLu::States.from_country(country_name).each do |data|
              class_object.where(data).first_or_create
          end

          puts "There are now #{pluralize(class_object.count, model_name)}"
        rescue => e
          raise "Could not find object for #{model_name}"
        end

      end

      private

        def connect_to_db
          ActiveRecord::Base.establish_connection db_config
        end

        def db_config
          Rails.configuration.database_configuration[::Rails.env]
        end

    end
  end
end