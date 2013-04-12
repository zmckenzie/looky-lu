desc 'make migrations'

namespace :ll do
  namespace :build do
    task :states do
      migrate = LookyLu::Generators::Migration.new
      migrate.copy('create_states')
    end
  end

  #namespace :populate do
  #  task :states do
  #    LookyLu::Generators::Data.populate State, States.united_states
  #  end
  #end

end