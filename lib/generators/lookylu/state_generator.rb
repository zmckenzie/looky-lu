require 'generators/lookylu/base_generator'

module Lookylu
  module Generators
    class StateGenerator < Lookylu::Generators::BaseGenerator
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc 'Build the state LU items'

      class_option :model, :type => :boolean, :default => true, :desc => "Generate a default model object."


      def generate_migration
        if Dir.glob(migration_location('*')).empty?
          template "states_migration.erb", migration_location(next_migration_number)
        end
      end

      def generate_model
        if options.model
          if Dir.glob(model_location).empty?
            template 'states_model.erb', model_location
          end
        end
      end

      private

      def next_migration_number
        Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
      end

      def migration_location version
        "db/migrate/#{version}_lookylu_create_#{plural_name}.rb"
      end

      def model_location
        "app/models/#{model_name}.rb"
      end

    end
  end
end
