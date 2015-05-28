Rake.application.remove_task 'db:test:load'
Rake.application.remove_task 'db:test:purge'

namespace :db do
  namespace :test do
    task :load do |_t|
      # nothing!
    end
    task :purge do |_t|
      # nothing!
    end
  end
end
