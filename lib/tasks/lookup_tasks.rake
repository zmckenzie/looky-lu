
namespace :lookylu do
  desc 'build the needed migrations'
  namespace :build do
    task :states do
      migrate = LookyLu::Generators::Migration.new
      migrate.copy('create_states')
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