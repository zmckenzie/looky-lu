
module LookyLu
  module Generators
    class Data
      def pluralize(count, singular, plural = nil) #pulled from http://api.rubyonrails.org/classes/ActionView/Helpers/TextHelper.html#method-i-pluralize
        "#{count || 0} " + ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
      end

      def class_name object
        object.to_s.split('::').last.downcase
      end

      def table_name object
        "#{class_name(object)}s"
      end

      def db_config
        Rails.configuration.database_configuration[::Rails.env]
      end

      def connect_to_db
        ActiveRecord::Base.establish_connection db_config
      end

      def populate object, list_of_objects
        connect_to_db
        tb_name = table_name(object)
        unless ActiveRecord::Base.connection.table_exists? tb_name
          raise "Table #{tb_name} does not exist. Please build the needed migration and migrate your database"
        end
        list_of_objects.each do |data|
          object.where(data).first_or_create
        end
        puts "There are now #{pluralize(object.count, class_name(object))}"
      end

    end
  end
end