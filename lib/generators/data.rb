
module LookyLu
  module Generators
    class Data

      def self.table_name object
        "#{object.to_s.split('::').last.downcase}s"
      end

      def self.db_config
        Rails.configuration.database_configuration[::Rails.env]
      end

      def self.connect_to_db
        ActiveRecord::Base.establish_connection db_config
      end

      def self.populate object, list_of_objects
        connection = connect_to_db
        tb_name = table_name(object)
        unless ActiveRecord::Base.connection.table_exists? tb_name
          puts "Table #{tb_name} does not exist. Please build the needed migration and migrate your database"
        end
        list_of_objects.each do |data|
          object.where(data).first_or_create
        end
      end

    end
  end
end