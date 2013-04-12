require 'rails/generators'

module LookyLu
  module Generators
    class Migration < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../../db/migrations', __FILE__)
      desc "add the migrations"

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy file_name
        migration_template "#{file_name}.rb", "db/migrate/#{file_name}.rb"
      end

    end
  end
end