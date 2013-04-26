
namespace :lookylu do
  desc 'build the needed migrations'
  namespace :build do
    task :states, :custom_name do |t, args|

      custom_name = args[:custom_name]
      custom_name = 'states' unless custom_name

      migrate = LookyLu::Generators::LookyluGenerator.new
      migrate.copy_migration 'create_states', custom_name
    end
  end

  desc 'populate the database with some data'
  namespace :populate do
    task :states do
      data_generator = LookyLu::Generators::Data.new
      data_generator.populate State, LookyLu::States.united_states
    end
  end

end

namespace :ll do
  namespace :b do
    task :states => 'lookylu:build:states'
  end

  namespace :p do
    task :states => 'lookylu:populate:states'
  end
end